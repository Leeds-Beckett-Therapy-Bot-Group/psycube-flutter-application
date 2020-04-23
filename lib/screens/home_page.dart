import 'package:flutter/material.dart';
import '../nav_bar.dart';
import '../tasks/task_tile.dart';
import '../constants.dart';
import '../tasks/task_tracker.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Psycube',
          style: kHeaderText,
        ),
      ),
      // bottomNavigationBar: NavBar(), todo: create pull out navigation
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todo: add task functionality
        },
        backgroundColor: kPrimaryBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(

            margin: EdgeInsets.all(15.0),
            child: Text(
              // todo: will need to grab username eventually
              'Hey username how are you doing today?',
              style: kSecondaryText,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: kPrimaryBlue,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Tracker()
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: kPrimaryBlue,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  TaskTile(),
                  TaskTile(),
                  TaskTile(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






