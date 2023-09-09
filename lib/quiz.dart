import 'package:advancequiz/question.dart';
import 'package:advancequiz/welcomescreen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activaScreen;
  @override
  void initState() {
    activaScreen = WelcomeScreen(switchscreen);
    super.initState();
  }

  void switchscreen() {
    setState(() {
      activaScreen = const QuestionScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            child: activaScreen),
      ),
    );
  }
}
