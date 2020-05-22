import 'dart:math';

import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/speech/dialogue_control.dart';
import 'package:therapyapp/speech/speech_recognition.dart';
import 'package:therapyapp/components/psycube_image.dart';

class ChatBot extends StatefulWidget {

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {

  DialogueControl dialogueControl = DialogueControl();
  ChatMessages chatMessage = ChatMessages();
  SpeechRecognition speechNavBar = SpeechRecognition();
  Face psycubeAvatar = Face();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Psycube',
          style: kHeaderText,
        ),
        backgroundColor: Color(0xFF107dac),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF005073), Color(0xFF71c7ec)])
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Face(), // components > psycube_image
            Expanded(
              child: Container(
                width: double.infinity,
                child: DialogueControl()
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: speechNavBar
            ),
          ],
        ),
      ),
    );
  }
}
