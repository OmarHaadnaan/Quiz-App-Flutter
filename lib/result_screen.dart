import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.choosenAnswr, this.reset, {super.key});
  final List<String> choosenAnswr;
  final void Function() reset;

  List<Map<String, String>> get summaryDat {
    List<Map<String, String>> summary = [];

    for (int i = 0; i < choosenAnswr.length; i++) {
      summary.add({
        'correct_answers': questions[i].asnwer[0],
        'user_answer': choosenAnswr[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalCorrectAnswers = summaryDat.where(
      (items) {
        return items['correct_answers'] == items['user_answer'];
      },
    ).length;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          "You answered ${totalCorrectAnswers}  out  ${questions.length} Questions Correctly!",
          textAlign: TextAlign.center,
          style: GoogleFonts.actor(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 72, 67, 67),
              fontStyle: FontStyle.italic,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        totalCorrectAnswers >= 3
            ? const Result(
                text: "GONGRATS",
                image: "images/win.png",
              )
            : const Result(
                text: "OH! NO ",
                image: "images/lost.png",
              ),
        const SizedBox(
          height: 20,
        ),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: reset,
          icon: Icon(
            CupertinoIcons.refresh_bold,
          ),
        ),
      ],
    ));
  }
}

class Result extends StatelessWidget {
  final text;
  final image;
  const Result({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 204, 4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              text,
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            image,
            width: 250,
          ),
        ],
      ),
    );
  }
}
