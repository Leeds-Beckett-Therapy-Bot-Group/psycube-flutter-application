import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF005073), Color(0xFF71c7ec)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TypewriterAnimatedTextKit(
                            speed: Duration(milliseconds: 500),
                            totalRepeatCount: 4,
                            pause: Duration(milliseconds:  1000),
                            text: ['PsyCube'],
                            textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kInputDecoration.copyWith(hintText:'Email'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kInputDecoration.copyWith(hintText: 'Password'),
                        ),
                        LoginButton(
                          text: 'Confirm details',
                          onPressed: () async {
                            try {
                              final NewUser = await _auth
                                  .createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if (NewUser != null) {
                                Navigator.pushNamed(context, '/ProfilePage');
                              }
                            } catch(e) {
                              print(e);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoginButton(
                      text: 'Already have an account? Log in here!',
                      onPressed: () {
                        Navigator.pushNamed(context, '/LoginPage');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
    );

  }
}
