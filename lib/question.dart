// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String? questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 3.0),
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 27, 185, 243),
          Color.fromARGB(255, 40, 130, 160)
        ])),
      // color: Color.fromARGB(255, 7, 201, 255),
      child: Text(
        questionText!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
        
      ),
    );
  }
}
