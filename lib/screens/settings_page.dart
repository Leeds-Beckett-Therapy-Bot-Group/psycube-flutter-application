import 'package:flutter/material.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'PsyCube',
          style: kHeaderText,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
          backgroundColor: Color(0xFF107dac)
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF005073), Color(0xFF71c7ec)])),
      )
    );
  }
}
