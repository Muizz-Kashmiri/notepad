import 'package:flutter/material.dart';
import 'package:notepad/model/task.dart';
import 'package:provider/provider.dart';
import 'package:notepad/model/todoList.dart';

import '../settings_screen.dart';

class TaskWidget extends StatelessWidget {
  // method to style completed/uncompleted item
  TextStyle _taskStyle(completed) {
    if (completed)
      return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
          fontSize: initFontValue,
      );
    else
      return TextStyle(
          decoration: TextDecoration.none, fontFamily: selectedFont, fontSize: initFontValue);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, task, child) {
      return GestureDetector(
        // onLongPress: (){
        //   Provider.of<TodoListModel>(context, listen: true).deleteTasksFromSharedPrefs();
        //   },
        child: CheckboxListTile(
          title: Text(
            task.text,
            style: _taskStyle(task.completed),
          ),
          value: task.completed,
          onChanged: (newValue) {
            task.toggle();
            Provider.of<TodoListModel>(context, listen: false)
                .saveTasksToSharedPrefs();
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    });
  }
}
