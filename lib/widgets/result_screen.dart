import 'package:flutter/material.dart';
import 'package:projects_2/data/questions.dart';
import 'package:projects_2/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() resetQuiz;

  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.resetQuiz,
  });

  static const name = "result_screen";

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final summaryData = getSummaryData();

    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answer  $numCorrectQuestions out of  $numTotalQuestions questions correctly",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 187, 116, 248),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(Icons.refresh),
              onPressed: () {
                resetQuiz();
              },
              label: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
