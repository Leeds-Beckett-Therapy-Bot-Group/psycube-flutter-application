import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: kInputDecoration.copyWith(hintText:'Enter your email'),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        onChanged: (value) {
                          //Do something with the user input.
                        },
                        decoration: kInputDecoration.copyWith(hintText: 'Enter your password'),
                      ),
                      LoginButton(
                          text: 'Login',
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
                    text: 'Sign Up',
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
        )
    );
  }
}


