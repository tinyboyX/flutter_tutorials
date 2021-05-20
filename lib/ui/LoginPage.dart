import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/Blocs/AuthenBLoc.dart';
import 'package:flutter_tutorials/Blocs/LoginBloc.dart';
import 'package:flutter_tutorials/Events/AuthenticationEvent.dart';
import 'package:flutter_tutorials/Events/LoginEvent.dart';
import 'package:flutter_tutorials/States/LoginState.dart';
import 'package:flutter_tutorials/repositories/user_repo.dart';
import 'package:flutter_tutorials/ui/Buttons/login_buttons.dart';
import 'package:flutter_tutorials/ui/Buttons/login_google_buttons.dart';
import 'package:flutter_tutorials/ui/Buttons/register_user_button.dart';

class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;

  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isEnableButton(LoginState state) {
    return state.isValidEmailAndPassword && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(() {
      //when email is changed,this function is called !
      _loginBloc.add(LoginEventEmailChanges(email: _emailController.text));
    });
    _passwordController.addListener(() {
      //when password is changed,this function is called !
      _loginBloc.add(LoginEventPasswordChanges(password: _passwordController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        if (loginState.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedIn());
        } else if (loginState.isSubmitting) {
          print('Logging In');
        } else if (loginState.isFailure) {
          print('Login Failed');
        }
        return Padding(
          padding: EdgeInsets.all(12),
          child: Form(
            child: ListView(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  validator: (_) {
                    return loginState.isValidEmail ? null : 'Invalid email format';
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Enter your password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autocorrect: false,
                  validator: (_) {
                    return loginState.isValidPassword ? null : 'Invalid password format';
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LoginButton(onPress: isEnableButton(loginState) ? _onLoginEmail : null),
                ),
                Padding(padding: EdgeInsets.all(10)),
                RegisterUserButton(userRepository: _userRepository),
                Padding(padding: EdgeInsets.all(10)),
                GoogleLoginButton()
              ],
            ),
          ),
        );
      },
    ));
  }

  void _onLoginEmail() {
    _loginBloc.add(LoginEventWithEmailAndPasswordPressed(email: _emailController.text, password: _passwordController.text));
  }
}
