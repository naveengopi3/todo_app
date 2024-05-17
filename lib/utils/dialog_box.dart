// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final  controllerTask;
  
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.controllerTask,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[300],
      content: Container(
        
        height: 130 ,
        child: Column(
          children: [
             TextField(
              controller: controllerTask,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black,
                  )),
                  hintText: 'Add a task'),
            ),
            const SizedBox(
              height: 10,
            ),
             
            Row(
              children: [
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel
                ),
                const SizedBox(width: 10,),
                MyButton(
                  text: "Save",
                 onPressed: onSave)
              ],
            )
          ],
        ),
      ),
    );
  }
}
