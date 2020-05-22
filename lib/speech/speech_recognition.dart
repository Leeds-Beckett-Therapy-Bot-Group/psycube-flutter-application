import 'package:flutter/material.dart';
import 'package:therapyapp/components/speech_button.dart';
import 'package:therapyapp/speech/dialogue_control.dart';

class SpeechRecognition extends StatefulWidget {
  @override
  _SpeechRecognitionState createState() => _SpeechRecognitionState();
}

class _SpeechRecognitionState extends State<SpeechRecognition> {
  final dialogueControl = DialogueControl();

  String microphoneActive() {
    dialogueControl.speechToText();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF107dac),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
              SpeechButton(
              icon:  Icons.mic,
              onTap: () {
                microphoneActive();
              },
          ),
          /*SpeechButton(
            icon: Icons.stop,
            onTap: speech.isListening ? stopListening : null,
          ),*/
          /*SpeechButton(
            icon: Icons.pause,
            onTap: speech.isListening ? cancelListening : null,
          ),*/
        ],
      ),
    );
  }
}
