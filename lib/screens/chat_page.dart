import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';

class ChatBot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: <Widget>[
              // todo: needs migrating to rawmaterialbutton
              FloatingActionButton(
                heroTag: 'button1',
                child: Icon(Icons.play_arrow),
              ),
              SizedBox(
                width: 20.0,
              ),
              // todo: needs migrating to rawmaterialbutton
              FloatingActionButton(
                heroTag: 'button2',
                child: Icon(Icons.stop),
              ),
            ],
          ),

          Expanded(
            child: Container(
              color: kAccentBlue,
            ),
          ),
        ],
      ),
    );
  }
}
