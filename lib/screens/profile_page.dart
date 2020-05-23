import 'package:flutter/material.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Psycube',
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
      ),
    );
  }
}
