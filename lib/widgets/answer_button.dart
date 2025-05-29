import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const AnswerButton({super.key, required this.label, required this.onPressed});

  static const name = "answer_button";

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 114, 5, 133),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(label, textAlign: TextAlign.center),
    );
  }
}
