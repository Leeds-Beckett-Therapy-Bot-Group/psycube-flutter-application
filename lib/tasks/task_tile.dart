import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'task_manager.dart';


enum Selection {
  selected,
  unselected
}

TaskManager taskManager = TaskManager();

class TaskTile extends StatefulWidget {
  TaskTileUpdate createState() => TaskTileUpdate();
}

class TaskTileUpdate extends State<TaskTile> {


  Selection selection;
  int _defaultScore = 0;
  int _levelOne = 1000;



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
