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

  /// function which formats value from addToTracker into a suitable
  /// format for percent: double
  double percentDisplay() {
    double percentage =  double.parse(percentUpdater) / 100;
    if (percentage >= 1.0) {
      percentage = 0.0;
      return percentage;
    } else {
      return percentage;
    }
  }

  /// funtion returns point value for display inside the tracker
  String trackerDisplay() {
    setState(() {
      percentUpdater = taskTileUpdate.addToTracker();
    });
    return percentUpdater;
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      radius: 100.0,
      lineWidth: 10.0,
      percent: percentDisplay(),
      animation: true,
      header: Text('Tracker', style: kSecondaryText,),
      center: Text(taskTileUpdate.addToTracker(), style: kHeaderText,),
      backgroundColor: Colors.white,
      progressColor: Colors.blue[700],
    );
  }
}