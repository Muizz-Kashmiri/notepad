import 'package:flutter/material.dart';
import 'package:notepad/model/task.dart';
import 'package:notepad/model/todoList.dart';
import 'package:notepad/screen/tasks/task.dart';
import 'package:provider/provider.dart';

import '../../my.i18n.dart';
import '../settings_screen.dart';

class TodoListWidget extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Consumer<TodoListModel>(builder: (context, tasks, child) {
        return ListView(
          children: tasks.tasks.map((TaskModel task) {
            return ChangeNotifierProvider.value(
                value: task, child: TaskWidget());
          }).toList(),
        );
      })),
      Consumer<TodoListModel>(
        builder: (context, tasks, child) {
          return TextField(
            style: TextStyle(fontFamily: selectedFont),
            controller: _controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                labelText: newtask.i18n),
            onSubmitted: (newTask) {
              tasks.addTask(TaskModel(
                  text:
                      newTask)); // create new instance of task changeNotifier model
              _controller.clear(); // clear the text input after adding task
              tasks.saveTasksToSharedPrefs();
            },
          );
        },
      )
    ]);
  }
}
