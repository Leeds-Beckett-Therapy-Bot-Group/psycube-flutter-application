import 'package:flutter/material.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PsyCube',
          style: kHeaderText,
        )
      ),
    );
  }
}
