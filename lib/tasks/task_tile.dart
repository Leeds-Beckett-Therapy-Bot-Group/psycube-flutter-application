import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'task_manager.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_animator/flutter_animator.dart';



class TaskTile extends StatefulWidget {
  TaskTileUpdate createState() => TaskTileUpdate();
}

/// tasks gets values from task_manager and adds them into task tiles
/// updates point scores and should update progress bar in screens/home_page
class TaskTileUpdate extends State<TaskTile> {
  TaskManager taskManager = TaskManager();
  //Register a key in your state:
  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();

  int _defaultScore = 0;

  // currently not in use?
  int _levelOne = 1000;

  // buggy, should take default score , grab point variable from
  // task_manager then add the two together, seems to be getting ran
  // multiple times unnecessarily from the task tiles, in the terminal you should
  // see the outputs getting printed and notice the problem
  String addToTracker() {
      int point = taskManager.getTaskPoint(); // see task_manager for assigned points
      _defaultScore = _defaultScore + point;
      print(""+ _defaultScore.toString());

    return( _defaultScore.toString());
  }

  void playSound() {
    final player = AudioCache();
    player.play('task_complete.mp3'); // audio should always be in an 'assets' folder
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addToTracker();
          playSound();
        });
      },

      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 3.0, color: Colors.white)
        ),

        // todo: need implementing within a dynamic list

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
