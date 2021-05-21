import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookLogin _facebookLogin;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn, FacebookLogin facebookLogin})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        _facebookLogin = facebookLogin ?? FacebookLogin();

  Future<void> signInWithEmail(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
  }

  // Future<User> signInWithFacebook() async {
  //   final FacebookLoginResult facebookLoginResult = await _facebookLogin.logIn(['email']);
  //   final FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
  //   final AuthCredential authCredential = FacebookAuthProvider.credential(facebookAccessToken.token);
  //   await _firebaseAuth.signInWithCredential(authCredential);
  //   return _firebaseAuth.currentUser;
  // }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    await _firebaseAuth.signInWithCredential(authCredential);
    return _firebaseAuth.currentUser;
  }

  Future<void> createWithEmail(String email, String password) async {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email.trim(), password: password);
  }

  Future<void> signOut() async {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }

  Future<bool> alreadySignIn() async {
    return _firebaseAuth.currentUser != null;
  }

  Future<User> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
