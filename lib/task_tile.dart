import 'package:flutter/material.dart';
import 'task_manager.dart';

TaskManager taskManager = TaskManager();

class TaskTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('listtile tapped');
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFFcaf2d7)
        ),
        child: ListTile(
          leading: Text(taskManager.getTaskTitle()),
          title: Text(taskManager.getTaskDescription()),
          trailing: Text(taskManager.getTaskPoint().toString()),
        ),
      ),
    );
  }
}