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

/// Personal reminder in case we need to delete:
/// Requirements for android: need to add permissions to
/// androidManifest - <uses-permission android:name="android.permission.RECORD_AUDIO" />
/// android.permission.INTERNET
/// build.gradle needed min sdk ver 21

/// Requirements for ios: need to add permissions to
/// info.plist - <key>NSMicrophoneUsageDescription</key>
/// <key> NSSpeechRecognitionUsageDescription</key>


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

