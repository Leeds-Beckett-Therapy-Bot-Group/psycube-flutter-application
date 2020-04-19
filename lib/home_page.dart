import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'nav_bar.dart';
import 'task_tile.dart';

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
          'Psycube'
        ),
      ),
      bottomNavigationBar: NavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(

            margin: EdgeInsets.all(15.0),
            child: Text(
              'Hey username how are you doing today?'
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Color(0xFFfddede),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Level 1'),
                      Text('Points this week:'),
                      Text('Total points'),

                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 10.0,
                        percent: 0.8,
                        animation: true,
                        header: Text('Tracker'),
                        center: Text('current_points'),
                        backgroundColor: Color(0xFFcaf2d7),
                        progressColor: Color(0xFFf5fec0),
                      ),
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
                  color: Color(0xFFfddede),
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




