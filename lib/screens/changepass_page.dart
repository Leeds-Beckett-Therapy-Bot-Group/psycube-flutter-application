import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import '../constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapyapp/user/user_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  String email;
  FirebaseAuth _auth;

  _initialLoginHandler() async {
    var currentUser = await UserAuth().checkLoggedIn(context);
    if (currentUser != null) {
      UserAuth().signOut(context);
      Navigator.pushReplacementNamed(context, '/LoginPage');
    }
  }
  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF499CD8), Color(0xFF55C5A6)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Please confirm your email below. You will recieve an email with instructions on how to change your password',
                textAlign: TextAlign.center,
                style: kProfilePageText,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: kInputDecoration.copyWith(hintText: 'confirm email'),
                onChanged: (value) {
                  email = value;
                },
              ),
              LoginButton(
                text: 'Confirm',
                onPressed: () {
                  _initialLoginHandler();
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
