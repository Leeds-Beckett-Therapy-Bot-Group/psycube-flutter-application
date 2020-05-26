import 'dart:math';
import 'package:flutter/material.dart';

class Face extends StatefulWidget {
  @override
  _FaceState createState() => _FaceState();

  void externalGenerator() {
    _FaceState().psycubeImageGenerator();
  }
}

class _FaceState extends State<Face> {
  int i;
  int randNumber = 0;

  void psycubeImageGenerator() async {
    setState(() {
      randNumber = Random().nextInt(6);
      print(randNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          psycubeImageGenerator();
        },
        child: Container(
          padding: EdgeInsets.all(35.0),
          child: Image.asset('images/psycube_$randNumber.png'),
        ),
      ),
    );
  }
}
