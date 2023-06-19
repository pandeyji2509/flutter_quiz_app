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
          "Which of the following is a way to handle data in React.js ?",
      "answers": ["State & Props", "Services & Components", "State & Services", "State & Component"],
      "correctAns": "State & Props",
    },
    {
      "question":
          "Which of the following is true regarding Babel ?",
      "answers": ["SetinitialComponent", "renderComponent", "render", "All of the above"],
      "correctAns": "renderComponent",
    },
    {
      "question": "How many types of widgets are there in Flutter?",
      "answers": ["2", "4", "6", "8", "8+"],
      "correctAns": "2",
    },
    {
      "question":
          "In React.js, how we can pass the data from one component to another in React.js ?",
      "answers": ["SetState", "Render with arguments", "Props", "	PropTypes"],
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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 86, 243, 251),
        appBar: AppBar(
          title: const Text("Ankit Pandey UE215014"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "Reset Quiz",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color.fromARGB(255, 36, 193, 236),
          onPressed: () {
            _resetQuiz();
          },
        ),
      body: Container(
          margin: const EdgeInsets.fromLTRB(300,50,300,0),
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
