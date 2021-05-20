import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/Blocs/LoginBloc.dart';
import 'package:flutter_tutorials/Events/LoginEvent.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: RaisedButton.icon(
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(LoginEventWithGooglePressed());
      },
      icon: Icon(FontAwesomeIcons.google, color: Colors.white, size: 17),
      label: Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      color: Colors.redAccent,
    ));
  }
}
