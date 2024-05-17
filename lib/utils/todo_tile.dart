// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(BuildContext)? deleteFunction;
  Function(bool?)? onChanged;
  TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              color: Colors.green),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Column(
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                        fontSize: 18,
                        decoration: taskCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
