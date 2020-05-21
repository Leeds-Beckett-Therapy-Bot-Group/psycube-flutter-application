import 'package:flutter/material.dart';

// Buttons on the login and sign up pages
class LoginButton extends StatelessWidget {
  LoginButton({this.text, @required this.onPressed});
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}