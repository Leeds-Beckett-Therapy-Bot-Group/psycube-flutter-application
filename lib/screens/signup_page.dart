import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:therapyapp/user/user_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email;
  String password;
  String confirmPassword;
  String displayName;

  _handleSignup() async {
    var newUser = await UserAuth()
        .createUserAndLogin(context, displayName, email, password);
    if (newUser != null) {
      Navigator.pushNamed(context, '/ProfilePage');
    }
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
                        pause: Duration(milliseconds: 1000),
                        text: ['PsyCube'],
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional.topStart),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        displayName = value;
                      },
                      decoration:
                          kInputDecoration.copyWith(hintText: 'First name'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kInputDecoration.copyWith(hintText: 'Email'),
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
                      decoration:
                          kInputDecoration.copyWith(hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      decoration: kInputDecoration.copyWith(
                          hintText: 'Confirm Password'),
                    ),
                    LoginButton(
                        text: 'Confirm details', onPressed: this._handleSignup),
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
    ));
  }
}
