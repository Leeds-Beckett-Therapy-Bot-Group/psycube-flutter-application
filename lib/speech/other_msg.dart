import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SimpleMessage extends StatelessWidget {
  SimpleMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
