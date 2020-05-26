import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/components/login_button.dart';
import 'package:therapyapp/user/user_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<bool> _initialLoginFuture;
  String email;
  String password;

  Future<bool> _initialLoginHandler() async {
    var currentUser = await UserAuth().checkLoggedIn(context);
    if (currentUser != null) {
      Navigator.pushReplacementNamed(context, '/ProfilePage');
      return true;
    }
    // Not Logged In
    return false;
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialLoginFuture == null) {
      _initialLoginFuture = this._initialLoginHandler();
    }
  }

  //login method, to be called on the click of a button on the ui.
  _attemptLogin() async {
    var user = await UserAuth().loginUser(context, email, password);
    if (user != null) {
      Navigator.pushNamed(context, '/ProfilePage');
    } else {
      throw FlutterError("User provided was null");
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
            colors: [Color(0xFF499CD8), Color(0xFF55C5A6)]),
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
