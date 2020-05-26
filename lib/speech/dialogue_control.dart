import "dart:async";
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';
import 'package:therapyapp/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'speech_recognition.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:therapyapp/components/psycube_image.dart';

class DialogueControl extends StatefulWidget {
  DialogueControl({Key key, this.title, this.lastWords}) : super(key: key);

  final String title;
  final String lastWords;

  @override
  _DialogueControlState createState() => _DialogueControlState();

  void speechToText() {
    _DialogueControlState().sTT();
  }
}

class _DialogueControlState extends State<DialogueControl> {
  Face psycubeImage = Face();
  SpeechRecognition speechRecognition = SpeechRecognition();
  FlutterTts flutterTts = FlutterTts();

  // variables for config voice emulation
  String language = 'en-AU-Standard-A';
  double volume = 1.5;
  double pitch = 1.4;
  double rate = 1.25;
  double pitchTest = 0.5;

  // variables for config in speech to text
  double level = 0.0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";

  // instantiate chatMessage list , an array which contains the conversation
  final List<ChatMessages> _messages = <ChatMessages>[];
  final TextEditingController _textController = TextEditingController();

  // listens for user speech and disengages when break of silence
  // first time may need user permission
  // ignore: missing_return
  Future<String> sTT() async {
    stt.SpeechToText speech = stt.SpeechToText();
    bool available = await speech.initialize(
        onStatus: statusListener, onError: errorListener);
    if (available) {
      speech.listen(onResult: getResultListener);
    } else {
      print("The user has denied the use of speech recognition.");
    }
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  // outputs true or false reading on deciphered text
  void statusListener(String status) {
    setState(() {
      lastStatus = "$status";
    });
  }

  // returns user text deciphered from speech
  void getResultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords =
          "${result.recognizedWords}"; //  - ${result.finalResult} (debugging status)
    });
    print(lastWords);
    /*return lastWords;*/
  }

  void psycubeImageGenerator() {
    psycubeImage.externalGenerator();
  }

  // text composer widget which allows a user to type in the text box
  // and send to the bot
  Widget buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                    hintText: "Send a message or press the mic"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  // fetches user responses and sends data to dialogFlow to be processed
  // inserts bot response into message box
  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessages message = ChatMessages(
      text: response.getMessage() ??
          TypeMessage(response.getListMessage()[0]).platform,
      name: "Psycube",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
      _speak(message.text);
      psycubeImageGenerator();
    });
  }

  // takes input text from response func and plays back voice
  Future _speak(String text) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitchTest);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setLanguage(language);
    await flutterTts.speak(text);
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessages message = ChatMessages(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    response(text);
    psycubeImageGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new Flexible(
          child: new ListView.builder(
        padding: new EdgeInsets.all(8.0),
        reverse: true,
        itemBuilder: (_, int index) => _messages[index],
        itemCount: _messages.length,
      )),
      new Divider(height: 1.0),
      new Container(
        decoration: new BoxDecoration(color: Theme.of(context).cardColor),
        child: buildTextComposer(),
      ),
    ]);
  }
}

// text bubble widgets
// need to take text input from stt or textComposer
class ChatMessages extends StatelessWidget {
  ChatMessages({this.text, this.name, this.type, this.lastWords});

  final String text;
  final String name;
  final String lastWords;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Expanded(
        child: Bubble(
          margin: BubbleEdges.only(top: 10.0),
          radius: Radius.circular(20.0),
          alignment: Alignment.topLeft,
          nip: BubbleNip.leftTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.name, style: kChatBotText),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Bubble(
          margin: BubbleEdges.only(top: 10.0),
          radius: Radius.circular(20.0),
          alignment: Alignment.topRight,
          nip: BubbleNip.rightTop,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(this.name, style: kChatBotText),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                    text), // or change to text for txt msg or lastWords for voice
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
