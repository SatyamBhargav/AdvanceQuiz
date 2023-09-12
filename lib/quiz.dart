import 'package:advancequiz/data/questions.dart';
import 'package:advancequiz/question_Screen.dart';
import 'package:advancequiz/result_screen.dart';
import 'package:advancequiz/welcomescreen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectAnswer = [];
  var activaScreen = 'start-screen';

  void switchscreen() {
    setState(() {
      activaScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectAnswer.add(answer);

    if (selectAnswer.length == questions.length) {
      setState(() {
        activaScreen = 'result-screen';
      });
    }
  }

  void resetQuestion() {
    setState(() {
      selectAnswer = [];
      activaScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(switchscreen);
    if (activaScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activaScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectAnswer,
        resetquiz: resetQuestion,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 84, 27, 218),
                  Color.fromARGB(255, 252, 113, 70),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
