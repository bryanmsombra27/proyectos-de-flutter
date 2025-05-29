import 'package:flutter/material.dart';
import 'package:projects_2/data/questions.dart';
import 'package:projects_2/widgets/questions_screen.dart';
import 'package:projects_2/widgets/result_screen.dart';
import 'package:projects_2/widgets/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  static const name = "quiz";

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // forma de mostrar un widget condicionalmente
  // late Widget activeScreen;

  // // se ejecuta este metodo antes que el build
  // @override
  // void initState() {
  //   Widget activeScreen = WelcomeScreen(startQuiz: switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = QuestionsScreen();
  //   });
  // }

  String activeScreen = "start-screen";
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomeScreen(startQuiz: switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 103, 48, 197),
                const Color.fromARGB(255, 59, 17, 131),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
