import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:therapyapp/constants.dart';
import 'task_tile.dart';

TaskTileUpdate taskTileUpdate = TaskTileUpdate();

class Tracker extends StatefulWidget {
  TrackerUpdate createState() => TrackerUpdate();
}

class TrackerUpdate extends State<Tracker> {

  String percentUpdater = taskTileUpdate.addToTracker();



  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      radius: 100.0,
      lineWidth: 10.0,
      percent: 0.0,
      animation: true,
      header: Text('Tracker', style: kSecondaryText,),
      center: Text(taskTileUpdate.addToTracker(), style: kHeaderText,),
      backgroundColor: Colors.white,
      progressColor: Colors.blue[700],
    );
  }
}