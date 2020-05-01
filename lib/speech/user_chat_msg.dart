//import 'package:flutter/material.dart';
//import 'package:bubble/bubble.dart';
//import 'package:therapyapp/constants.dart';
//
//
//class ChatMessages extends StatelessWidget {
//  ChatMessages({this.text, this.name, this.type});
//
//  final String text;
//  final String name;
//  final bool type;
//
//  List<Widget> otherMessage(context) {
//    return <Widget>[
//      Expanded(
//        child: Bubble(
//          margin: BubbleEdges.only(top: 10.0),
//          radius: Radius.circular(20.0),
//          alignment: Alignment.topLeft,
//          nip: BubbleNip.leftTop,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(this.name, style:kChatBotText),
//              Container(
//                margin: const EdgeInsets.only(top: 5.0),
//                child: Text(text),
//              ),
//            ],
//          ),
//        ),
//      ),
//    ];
//  }
//
//  List<Widget> myMessage(context) {
//    return <Widget>[
//      Expanded(
//        child: Bubble(
//          margin: BubbleEdges.only(top: 10.0),
//          radius: Radius.circular(20.0),
//          alignment: Alignment.topRight,
//          nip: BubbleNip.rightTop,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            children: <Widget>[
//              Text(this.name, style: Theme.of(context).textTheme.subhead),
//              Container(
//                margin: const EdgeInsets.only(top: 5.0),
//                child: Text(text),
//              ),
//            ],
//          ),
//        ),
//      ),
//      new Container(
//        margin: const EdgeInsets.only(left: 16.0),
//        child: CircleAvatar(child: Text(this.name[0])),
//      ),
//    ];
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      margin: const EdgeInsets.symmetric(vertical: 10.0),
//      child: new Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: this.type ? myMessage(context) : otherMessage(context),
//      ),
//    );
//  }
//}
