import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) addjawbo;
  const QuestionsScreen(this.addjawbo, {super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: 0.7,
              child: Image.asset(
                "images/image.png",
                width: 300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BubbleBox(
                padding: EdgeInsets.all(20),
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                shape: BubbleShapeBorder(
                  border: BubbleBoxBorder(
                    color: Colors.white,
                    width: 3,
                  ),
                  position: const BubblePosition.center(0),
                  direction: BubbleDirection.right,
                ),
                backgroundColor: Colors.white,
                child: Text(
                  questions[currentIndex].textAnswer,
                  style: GoogleFonts.alice(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      wordSpacing: 3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  textAlign: TextAlign.center,
                )),
            const SizedBox(
              height: 20,
            ),
            ...questions[currentIndex].shuffledData.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex++;
                      widget.addjawbo(item);
                    });
                  },
                  child: Center(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
