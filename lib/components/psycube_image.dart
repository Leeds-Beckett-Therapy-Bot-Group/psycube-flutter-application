import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class Face extends StatefulWidget {
  @override
  _FaceState createState() => _FaceState();

  void externalGenerator() {
    _FaceState().psycubeImageGenerator();
  }
}

class _FaceState extends State<Face> with TickerProviderStateMixin {
  int i;
  int randNumber = 0;

  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();


  void psycubeImageGenerator() async {
    setState(() {
      randNumber = Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          psycubeImageGenerator();
          _key.currentState.forward();
        },
        child: RubberBand(
          key: _key,
          child: Container(
            // height: size,
            padding: EdgeInsets.all(35.0),
            child: Image.asset('images/psycube_$randNumber.png'),
          ),
        ),
      ),
    );
  }
}
