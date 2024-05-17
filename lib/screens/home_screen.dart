// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/db.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');

  @override
  void initState() {
    db.loadData();
    super.initState();
  }

  TodoDataBase db = TodoDataBase();

  final _taskController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.update();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controllerTask: _taskController,
            onSave: saveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_taskController.text, false]);
      _taskController.clear();
    });
    db.update();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
          onPressed: () {
            createNewTask();
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.green[100],
        body: db.todoList.isEmpty
            ? const Center(
                child: Text("Create new task"),
              )
            : ListView.builder(
                itemCount: db.todoList.length,
                itemBuilder: (context, index) {
                  return TodoList(
                    taskName: db.todoList[index][0],
                    taskCompleted: db.todoList[index][1],
                    onChanged: (value) => checkBoxChanged(value, index),
                    deleteFunction: (context) => deleteTask(index),
                  );
                }));
  }
}
