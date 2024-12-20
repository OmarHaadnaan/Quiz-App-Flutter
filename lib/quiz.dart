import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/questions.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> jawaabo = [];
  String activeScreen = "Start";

  void reset() {
    setState(() {
      activeScreen = "questions-screen";
      jawaabo = [];
    });
  }

  void addjawaabo(String answer) {
    jawaabo.add(answer);

    if (jawaabo.length == questions.length) {
      setState(() {
        activeScreen = 'r-screen'; //result screen
      });
    }

    print(jawaabo);
  }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffF9DC04),
                Color(0xffF9DC04),
              ],
            ),
          ),
          child: Center(
            child: activeScreen == 'Start'
                ? StartScreen(switchScreen)
                : activeScreen == "questions-screen"
                    ? QuestionsScreen(addjawaabo)
                    : ResultScreen(jawaabo, reset),
          ),
        ),
      ),
    );
  }
}
