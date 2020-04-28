import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:bubble/bubble.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import '../components/navigation_drawer.dart';

class ChatBot extends StatefulWidget {

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  // instantiate flutter text to speech module
  FlutterTts flutterTts = FlutterTts();

  // variables for use in text to speech
  String introText = 'Hey user, when you\'re ready, wake me up '
                      'by pressing my on button';

  String introText2 = 'Press play or say "Start" to begin a session. You can stop the session '
                        'by pressing the Stop button or by saying "Stop" ';

  int _introChatTracker = 0;
  String language = 'en-AU-Standard-A';
  double volume = 1.5;
  double pitch = 1.4;
  double rate = 1.25;

  // variables for use in speech to text
  bool _hasSpeech = false;
  double level = 0.0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {

    // _introChatTracker should be incremented to ensure this is only ran once
    Future _speak() async {
      while (_introChatTracker == 0) {
        await flutterTts.setVolume(volume);
        await flutterTts.setPitch(pitch);
        await flutterTts.setSpeechRate(rate);
        await flutterTts.setLanguage(language);
        await flutterTts.speak(introText);

        _introChatTracker++;
      }
    }

    _speak();

    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Psycube',
          style: kHeaderText,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(35.0),
              child: Image.asset('images/cube-placeholder.png'),

            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // todo: needs migrating to rawmaterialbutton
              FloatingActionButton(
                heroTag: 'button0',
                child: Icon(Icons.power_settings_new),
                onPressed: _hasSpeech ? null : initSpeechState,
              ),
              // todo: needs migrating to rawmaterialbutton
              FloatingActionButton(
                heroTag: 'button1',
                child: Icon(Icons.play_arrow),
                onPressed: !_hasSpeech || speech.isListening
                            ? null
                            : startListening,
              ),
              // todo: needs migrating to rawmaterialbutton
              FloatingActionButton(
                heroTag: 'button2',
                child: Icon(Icons.stop),
                onPressed: speech.isListening ? stopListening : null,
              ),
              FloatingActionButton(
                heroTag: 'button3',
                child: Icon(Icons.pause),
                onPressed: speech.isListening ? cancelListening : null,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: kAccentBlue,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Bubble(
                      alignment: Alignment.center,
                      child: Text('Today' ,
                      style: kChatBotText,),
                    ),
                    Bubble(
                      margin: BubbleEdges.only(top: 10.0),
                      radius: Radius.circular(20.0),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      child: Text(introText,
                      style: kChatBotText,)
                    ),
                    Bubble(
                        margin: BubbleEdges.only(top: 10.0),
                        radius: Radius.circular(20.0),
                        alignment: Alignment.topRight,
                        nip: BubbleNip.rightTop,
                        child: Text(lastWords,
                          style: kChatBotText,)
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }

}
