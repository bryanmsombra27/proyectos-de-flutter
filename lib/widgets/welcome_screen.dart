import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  final void Function() startQuiz;

  const WelcomeScreen({super.key, required this.startQuiz});

  static const name = "welcome_screen";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: .6,
          //   child: Image.asset("assets/images/quiz-logo.png", width: 300),
          // ),
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          SizedBox(height: 80),
          Text(
            "Learn flutter the fun way!",
            style: GoogleFonts.lato(color: Colors.white, fontSize: 24),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            icon: Icon(Icons.arrow_right_alt),
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
