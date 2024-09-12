class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffeldList = List.of(answers);
    shuffeldList.shuffle();
    return shuffeldList;
  }
}