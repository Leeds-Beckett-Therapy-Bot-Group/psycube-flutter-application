import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'task_manager.dart';

class TaskTile extends StatefulWidget {
  TaskTileUpdate createState() => TaskTileUpdate();
}

/// tasks gets values from task_manager and adds them into task tiles
/// updates point scores and should update progress bar in task_tracker
class TaskTileUpdate extends State<TaskTile> {
  TaskManager taskManager = TaskManager();

  int _defaultScore = 0;

  // currently not in use?
  int _levelOne = 1000;

  /// buggy, should take default score , grab point variable from
  /// task_manager then add the two together, seems to be getting ran
  /// multiple times unnecessarily from the task tiles, in the terminal you should
  /// see the outputs getting printed and notice the problem
  /// check task_tracker for where the widget should get updated
  String addToTracker() {
      int point = taskManager.getTaskPoint(); // see task_manager for assigned points
      _defaultScore = _defaultScore + point;
      print(""+ _defaultScore.toString());

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

        // leading gets task title from task_manager class
        // title gets task descr from task_manager class
        // trailing gets point value from task_manager class
        // in task_manager these three values are randomzied within a function
        // the issue with this is that all values are randomzied so task titles
        // currently do not match with the relevant descriptions
        child: ListTile(
          leading: Text(taskManager.getTaskTitle(), style: kSecondaryText,),
          title: Text(taskManager.getTaskDescription(), style: kSecondaryText),
          trailing: Text(taskManager.getTaskPoint().toString(), style: kSecondaryText),
        ),
      ),
    );
  }
}
