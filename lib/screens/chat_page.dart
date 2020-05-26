import 'dart:math';

import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/speech/dialogue_control.dart';
import 'package:therapyapp/speech/speech_recognition.dart';
import 'package:therapyapp/charts/db_handler.dart';
import 'package:therapyapp/charts/happiness.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/user/login_model.dart';
import 'package:therapyapp/components/psycube_image.dart';

class ChatBot extends StatefulWidget {

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {

  DialogueControl dialogueControl = DialogueControl();
  ChatMessages chatMessage = ChatMessages();
  SpeechRecognition speechNavBar = SpeechRecognition();
  double _sliderValue = 5.0;

  // variables for use in text to speech
  String introText = 'Hey user, when you\'re ready, wake me up '
                      'by pressing my on button';

  String introText2 = 'Press play or say "Start" to begin a session. You can stop the session '
                        'by pressing the Stop button or by saying "Stop" ';

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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF499CD8), Color(0xFF55C5A6)])
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
            Text("Happiness: ${_sliderValue.toInt()}/10",
                style: TextStyle(color: Colors.black54, fontSize: 20)),
            Slider(
              onChanged: this._onSliderChange,
              value: _sliderValue,
              min: 0,
              max: 10,
              divisions: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: speechNavBar
            ),
            Consumer<LoginModel>(
              builder: (context, loginModel, child) => RaisedButton(
                onPressed: () => this._submitValue(loginModel.user.uid),
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSliderChange(double newValue) {
    setState(() {
      _sliderValue = newValue;
    });
  }

  void _submitValue(String uid) {
    DBHandler dbManager = DBHandler(uid);
    var happiness = Happiness(_sliderValue.toInt());
    dbManager.writeHappiness(happiness);
  }

}
