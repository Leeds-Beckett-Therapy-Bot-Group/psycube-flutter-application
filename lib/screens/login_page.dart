import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapyapp/user/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  Future<bool> _initialLoginFuture;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
  }

  //checks if the user is logged in. if true, navigate to the profile page
  Future<bool> _initialLoginHandler() async {
    try {
      LoginModel loginModel = Provider.of<LoginModel>(context, listen: false);
      var currentUser = await FirebaseAuth.instance.currentUser();
      if (currentUser != null) {
        //alls the populate user method from login model to apply user information across state
        loginModel.populateUser(currentUser);
        Navigator.pushReplacementNamed(context, '/ProfilePage');
        return true;
      }
      // Not Logged In
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialLoginFuture == null) {
      _initialLoginFuture = this._initialLoginHandler();
    }
  }

  //login method, to be called on the click of a button on the ui.
  _attemptLogin() async {
    try {
      var loginModel = Provider.of<LoginModel>(context, listen: false);
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        //calls the populate user method from login model to apply user information across state
        loginModel.populateUser(result.user);
        Navigator.pushNamed(context, '/ProfilePage');
      } else {
        throw FlutterError("User provided was null");
      }
    } catch (e) {
      print(e);
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
            colors: [Color(0xFF005073), Color(0xFF71c7ec)]),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: _initialLoginFuture == null
            ? SizedBox.shrink()
            : FutureBuilder<bool>(
                future: _initialLoginFuture,
                builder: (context, snapshot) =>
                    // Only render login if initial check has completed and the user is not logged in
                    snapshot.hasData && snapshot.data == false
                        ? Column(
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
                                          alignment:
                                              AlignmentDirectional.topStart),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        textAlign: TextAlign.center,
                                        onChanged: (value) {
                                          email = value;
                                        },
                                        decoration: kInputDecoration.copyWith(
                                            hintText: 'Enter your email'),
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
                                        decoration: kInputDecoration.copyWith(
                                            hintText: 'Enter your password'),
                                      ),
                                      LoginButton(
                                        text: 'Login',
                                        onPressed: this._attemptLogin,
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
                                      Navigator.pushNamed(
                                          context, '/SignUpPage');
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        : SizedBox.shrink(),
              ),
      ),
    ));
  }
}
