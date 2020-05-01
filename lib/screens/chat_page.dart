import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/speech/dialogue_control.dart';
import 'package:therapyapp/speech/speech_recognition.dart';

class ChatBot extends StatefulWidget {

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  DialogueControl dialogueControl = DialogueControl();
  ChatMessages chatMessage = ChatMessages();
  SpeechRecognition speechNavBar = SpeechRecognition();

  // variables for use in text to speech
  String introText = 'Hey user, when you\'re ready, wake me up '
                      'by pressing my on button';

  String introText2 = 'Press play or say "Start" to begin a session. You can stop the session '
                        'by pressing the Stop button or by saying "Stop" ';


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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(35.0),
                child: Image.asset('images/cube-placeholder.png'),
              ),
            ),
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
