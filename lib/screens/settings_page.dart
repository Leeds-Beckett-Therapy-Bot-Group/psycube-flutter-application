import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapyapp/user/login_model.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _auth = FirebaseAuth.instance;
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
          backgroundColor: Color(0xFF107dac)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF005073), Color(0xFF71c7ec)]),
        ),
        child: Column(
          children: <Widget>[
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Log Out'),
              onPressed: () {
                Provider.of<LoginModel>(context, listen: false).removeUser();
                _auth.signOut();
                Navigator.pushNamed(context, '/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
