import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import '../tasks/task_tile.dart';
import '../constants.dart';
import '../tasks/task_tracker.dart';
import 'package:therapyapp/components/navigation_drawer.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(child: Tracker()),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    FadeInLeft(child: TaskTile()),
                    FadeInRight(child: TaskTile()),
                    FadeInLeft(child: TaskTile()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


