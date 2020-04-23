import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'constants.dart';

void main() => runApp(Psycube());

// git: https://github.com/Leeds-Beckett-Therapy-Bot-Group/psycube-flutter-application.git

// todo: design profile page
// todo: design chat page
// todo: design settings page
// todo: fix bottom nav bar

// todo: make your own test branch - git checkout -b "your_branch_name"

class Psycube extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: kPrimaryBlue,
          accentColor: Color(0xFFFFFFFF),
          scaffoldBackgroundColor: kPrimaryBlue
        ),
        home: Scaffold(
          body: SafeArea(child: Homepage()),
        ));
  }
}

