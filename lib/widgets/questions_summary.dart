import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  static const name = "questions_summary";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          spacing: 30,
          children: summaryData
              .map(
                (summary) => Row(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            summary['user_answer'] == summary['correct_answer']
                            ? Colors.green
                            : Colors.red,

                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Text(
                        ((summary['question_index'] as int) + 1).toString(),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summary["question"] as String,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 187, 116, 248),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            summary["user_answer"] as String,
                            style: TextStyle(
                              color:
                                  summary['user_answer'] ==
                                      summary['correct_answer']
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),

                          if (summary['user_answer'] !=
                              summary['correct_answer'])
                            Text(
                              summary["correct_answer"] as String,
                              style: TextStyle(color: Colors.green),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
