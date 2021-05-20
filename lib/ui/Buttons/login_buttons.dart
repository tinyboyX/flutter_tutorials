import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPress;

  LoginButton({Key key, VoidCallback onPress})
      : _onPress = onPress,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: ElevatedButton(
      onPressed: _onPress,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))))),
      child: Text(
        'Login to your account',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ));
  }
}
