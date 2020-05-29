import 'package:audioplayers/audio_cache.dart';
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
import 'package:flutter_animator/flutter_animator.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  DialogueControl dialogueControl = DialogueControl();
  ChatMessages chatMessage = ChatMessages();
  SpeechRecognition speechNavBar = SpeechRecognition();
  double _sliderValue = 5.0;
  Face psycubeAvatar = Face();

  void playSound() {
    final player = AudioCache();
    player.play('task_complete.mp3'); // audio should always be in an 'assets' folder
  }

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
                colors: [Color(0xFF499CD8), Color(0xFF55C5A6)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: RubberBand(
                  child: Face()
              ),
            ), // components > psycube_image
            Expanded(
              child:
                  Container(width: double.infinity, child: DialogueControl()),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: speechNavBar),
            Text("Happiness: ${_sliderValue.toInt()}/10",
                style: kSecondaryText),
            Slider(
              onChanged: this._onSliderChange,
              activeColor: Color(0xFF107dac),
              inactiveColor: Colors.white,
              value: _sliderValue,
              min: 0,
              max: 10,
              divisions: 10,
            ),
            Consumer<LoginModel>(
              builder: (context, loginModel, child) => OutlineButton(
                onPressed: () {
                  this._submitValue(loginModel.user.uid);
                  playSound();
                },
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                child: Text("Submit",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Baloo',
                )),
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
