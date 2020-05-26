import 'dart:math';
import 'package:flutter/material.dart';

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

  void psycubeImageGenerator() async {
    setState(() {
      randNumber = Random().nextInt(6);
    });
  }

  AnimationController motionController;
  Animation motionAnimation;
  double size = 20;

  void initState() {
    super.initState();

    motionController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.5,
    );

    motionAnimation = CurvedAnimation(
      parent: motionController,
      curve: Curves.ease,
    );

    motionController.forward();
    motionController.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          motionController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          motionController.forward();
        }
      });
    });

    motionController.addListener(() {
      setState(() {
        size = motionController.value * 250;
      });
    });
    // motionController.repeat();
  }

  @override
  void dispose() {
    motionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          psycubeImageGenerator();
        },
        child: Container(
          // height: size,
          padding: EdgeInsets.all(35.0),
          child: Image.asset('images/psycube_$randNumber.png'),
        ),
      ),
    );
  }
}
