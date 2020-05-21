import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: kInputDecoration.copyWith(hintText:'Email'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: kInputDecoration.copyWith(hintText: 'Password'),
                        ),
                        LoginButton(
                          text: 'Confirm details',
                          onPressed: () {
                            Navigator.pushNamed(context, '/ProfilePage');
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
                        Navigator.pushNamed(context, '/SignUpPage');
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
