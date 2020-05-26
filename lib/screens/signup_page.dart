import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/user/login_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String confirmPassword;
  String displayName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      decoration:
                      kInputDecoration.copyWith(hintText: 'Confirm Password'),
                    ),
                    LoginButton(
                      text: 'Confirm details',

                      //create the user using variables from the textboxes (email password and display name String vars)
                      onPressed: () async {
                        try {
                          var loginModel = Provider.of<LoginModel>(context, listen: false);
                          final newUser = await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                          FirebaseUser user = await _auth.currentUser();
                          UserUpdateInfo updateInfo = UserUpdateInfo();
                          updateInfo.displayName = displayName;
                          user.updateProfile(updateInfo);

                          if (newUser != null) {
                            loginModel.populateUser(newUser.user);
                            Navigator.pushReplacementNamed(context, '/ProfilePage');
                          }
                        } catch(e) {
                          print(e);
                        }
                      }
//                        try {
//                          final newUser =
//                              await _auth.createUserWithEmailAndPassword(
//                                  email: email, password: password);
//
//                          FirebaseUser user = await _auth.currentUser();
//                          UserUpdateInfo updateInfo = UserUpdateInfo();
//                          updateInfo.displayName = displayName;
//                          user.updateProfile(updateInfo);
//                          if (newUser != null) {
//
//                            Navigator.pushReplacementNamed(context, '/ProfilePage');
//                          }
//                        } catch (e) {
//                          print(e);
//                        }
//                      },
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
    ));
  }
}
