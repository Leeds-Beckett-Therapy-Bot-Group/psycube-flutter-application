import 'package:flutter/material.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/user/user_auth.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/user/login_model.dart';

import '../constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              colors: [Color(0xFF499CD8), Color(0xFF55C5A6)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: Center(
                child: Consumer<LoginModel>(
                  builder: (context, loginModel, child) => Text(
                    'logged in as: ${loginModel.user.email}',
                    style: kProfilePageText,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 300,
                      height: 45,
                      child: OutlineButton(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/ChangePasswordPage');
                        },
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 300,
                      height: 45,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/DelAccountPage');
                        },
                        borderSide: BorderSide(
                          width: 2,
                          color: Color(0xFFb23b3b),
                        ),
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                            color: Color(0xFFb23b3b),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text('Log Out',
                          style: TextStyle(color: Color(0xFFb23b3b))),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/LoginPage');
                        UserAuth().signOut(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
