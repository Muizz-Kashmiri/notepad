import 'package:provider/provider.dart';
import 'package:notepad/model/todoList.dart';
import 'package:notepad/screen/tasks/todolist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../my.i18n.dart';
import '../settings_screen.dart';

class Tasks extends StatefulWidget {
//   // display completed tasks screen
//   void _goToCompletedTasks(context, todoList) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => CompletedTasks(todoList: todoList)));
//   }

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  clearTasks() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    // get tasks from shared preferences
    final TodoListModel todoList = TodoListModel();
    // getTasksFromSharedPrefs call notifyListeners
    todoList.getTasksFromSharedPrefs();

    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          title: Text(
            todolist.i18n,
            style: TextStyle(
              fontFamily: selectedFont,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: Center(
                  child: Text(
                clear.i18n,
                style: TextStyle(fontFamily: selectedFont),
              )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                  icon: Icon(Icons.check_circle_outline_rounded),
                  onPressed: () {
                    setState(() {
                      clearTasks();
                    });
                  }),
            ),
          ],
        ),
        body: ChangeNotifierProvider.value(
          value: todoList,
          child: TodoListWidget(),
        ));
  }
}
