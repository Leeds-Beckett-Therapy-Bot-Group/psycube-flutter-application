import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';
import 'package:therapyapp/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'speech_recognition.dart';


class DialogueControl extends StatefulWidget {
  DialogueControl({Key key, this.title}) : super (key: key);

  final String title;

  @override
  _DialogueControlState createState() => _DialogueControlState();
}

class _DialogueControlState extends State<DialogueControl> {

  SpeechRecognition speechRecognition = SpeechRecognition();
  FlutterTts flutterTts = FlutterTts();

  String language = 'en-AU-Standard-A';
  double volume = 1.5;
  double pitch = 1.4;
  double rate = 1.25;

  // instantiate chatMessage list , an array which contains the conversation
  final List<ChatMessages> _messages = <ChatMessages>[];
  final TextEditingController _textController = TextEditingController();

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
                decoration:
                InputDecoration.collapsed(hintText: "Send a message"),
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

  void response(query) async {
    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/credentials.json").build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle,language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessages message = ChatMessages(
      text: response.getMessage() ?? TypeMessage(response.getListMessage()[0]).platform,
      name: "Psycube",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
      _speak(message.text);
    });
  }

  Future _speak(String text) async {
      await flutterTts.setVolume(volume);
      await flutterTts.setPitch(pitch);
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

class ChatMessages extends StatelessWidget {
  ChatMessages({this.text, this.name, this.type, this.speechRecognition});

  final String speechRecognition;
  final String text;
  final String name;
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
              Text(this.name, style:kChatBotText),
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
                child: Text(text),
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
