class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion({required this.text, required this.answers});

  List<String> getSuffleAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
