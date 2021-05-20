import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/Blocs/AuthenBLoc.dart';
import 'package:flutter_tutorials/Blocs/LoginBloc.dart';
import 'package:flutter_tutorials/Events/AuthenticationEvent.dart';
import 'package:flutter_tutorials/States/AuthenState.dart';
import 'package:flutter_tutorials/repositories/user_repo.dart';
import 'package:flutter_tutorials/ui/HomePage.dart';
import 'package:flutter_tutorials/ui/LoginPage.dart';
import 'package:flutter_tutorials/ui/SplashPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login with Firebase',
        home: BlocProvider(
          create: (context) => AuthenticationBloc(userRepository: _userRepository)..add(AuthenticationEventStart()),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, authenticationState) {
              if (authenticationState is AuthenticationStateSuccess) {
                return HomePage();
              } else if (authenticationState is AuthenticationStateFailure) {
                return BlocProvider<LoginBloc>(
                    create: (context) => LoginBloc(userRepository: _userRepository), child: LoginPage(userRepository: _userRepository) //LoginPage,
                    );
              } else {
                return SplashPage();
              }
            },
          ),
        ));
  }
}
