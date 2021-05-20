import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      // ignore: deprecated_member_use
      child: RaisedButton(
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        color: Colors.green,
        child: Text(
          'Register',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        onPressed: () {
          this._onPressed();
          //Navigate back
        },
      ),
    );
  }
}
