import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

/// speech_recognition throws error on build but maybe doesn't affect
/// functionality

class SpeechRecogniser extends StatefulWidget {
  @override
  _SpeechRecogniserState createState() => _SpeechRecogniserState();
}

class _SpeechRecogniserState extends State<SpeechRecogniser> {

  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String outputText = "";

  @override
  void initState() {
    super.initState();
  }

  void speechRecorder() {
    if (_isAvailable && !_isListening)
      _speechRecognition
          .listen()
          .then((result) => print('$result'));
  }

  void initSpeechRecogniser () {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
            (bool result) => setState(() => _isAvailable = result)
    );

    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true)
    );

    _speechRecognition.setRecognitionResultHandler(
        (String speech) => setState(() => outputText = speech)
    );

    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false)
    );

    _speechRecognition.activate().then(
        (result) => setState(() => _isAvailable = result)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
