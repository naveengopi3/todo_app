// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
   MyButton({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.green,
      onPressed: onPressed,
      child: Text(text),
      );
  }
}