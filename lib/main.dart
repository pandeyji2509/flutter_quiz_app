import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const List<Map<String, dynamic>> _questions = [
    {
      "question":
          "Who developed the Flutter Framework and continues to maintain it today?",
      "answers": ["FaceBook", "Microsoft", "Google", "Oracle", "Apple"],
      "correctAns": "Google",
    },
    {
      "question":
          "Which programming language is used to build Flutter applications?",
      "answers": ["Kotlin", "Dart", "Java", "Go", "Python"],
      "correctAns": "Dart",
    },
    {
      "question": "How many types of widgets are there in Flutter?",
      "answers": ["2", "4", "6", "8", "8+"],
      "correctAns": "2",
    },
    {
      "question":
          "Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?",
      "answers": ["main()", "runApp()", "container()", "root()"],
      "correctAns": "runApp()",
    },
    {
      "question":
          "What is the key configuration file used when building a Flutter project?",
      "answers": ["pubsec.yaml", "pubsec.xml", "config.html", "root.xml"],
      "correctAns": "pubsec.yaml",
    },
  ];

  void _answerQuestion(int res) {
    setState(() {
      totalScore += res;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My app title"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "Reset Quiz",
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            _resetQuiz();
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: _questionIndex >= _questions.length
              ? Result(totalScore)
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
