import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() switchscreen;
  const StartScreen(this.switchscreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/lg.png"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: const RoundedRectangleBorder(),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              size: 40,
            ),
            onPressed: switchscreen,
            label: const Text(
              "Start Quiz    ",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
