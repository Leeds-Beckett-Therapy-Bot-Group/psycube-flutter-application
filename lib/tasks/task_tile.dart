import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'task_manager.dart';

class TaskTile extends StatefulWidget {
  TaskTileUpdate createState() => TaskTileUpdate();
}

class TaskTileUpdate extends State<TaskTile> {
  TaskManager taskManager = TaskManager();

  int _defaultScore = 0;
  int _levelOne = 1000;

  // buggy, should take default score , grab point variable from
  // task_manager then add the two together, seems to be getting ran
  // multiple times unnecessarily from the task tiles
  String addToTracker() {
      int point = taskManager.getTaskPoint(); // see task_manager for assigned points
      _defaultScore = _defaultScore + point;
      print(_defaultScore);

    return( _defaultScore.toString());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addToTracker();
        });
      },

      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 3.0, color: Colors.white)
        ),

        // todo: need implementing within a dynamic list
        child: ListTile(
          leading: Text(taskManager.getTaskTitle(), style: kSecondaryText,),
          title: Text(taskManager.getTaskDescription(), style: kSecondaryText),
          trailing: Text(taskManager.getTaskPoint().toString(), style: kSecondaryText),
        ),
      ),
    );
  }
}
