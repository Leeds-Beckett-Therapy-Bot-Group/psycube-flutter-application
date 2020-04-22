import 'package:flutter/material.dart';
import 'home_page.dart';
import 'constants.dart';

void main() => runApp(Psycube());

// for palettes check:
// https://colorhunt.co/palette/131456
// https://colorhunt.co/palette/133859
// https://colorhunt.co/palette/151784
// https://colorhunt.co/palette/155005 (morning mode) - not working?
// https://colorhunt.co/palette/165211 (night mode)
// https://colorhunt.co/palette/147389 (evening mode)
// git:

// todo: design profile page
// todo: design chat page
// todo: design settings page
// todo: fix bottom nav bar

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

