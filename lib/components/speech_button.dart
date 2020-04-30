import 'package:flutter/material.dart';

class SpeechButton extends StatelessWidget {
  SpeechButton({this.icon, this.onTap});

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      child: Icon(icon,
        color: Colors.white,
      ),
    );
  }
}
