import 'package:flutter/material.dart';
import 'home_page.dart';

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
          primaryColor: Color(0xFFf5fec0),
          accentColor: Color(0xFFfddede),
          scaffoldBackgroundColor: Color(0xFF60a9a6
          ),
        ),
        home: Scaffold(
          body: SafeArea(child: Homepage()),
        ));
  }
}

