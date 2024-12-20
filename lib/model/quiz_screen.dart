class QuizQuestion {
  String textAnswer;
  List<String> asnwer;
  QuizQuestion(this.textAnswer, this.asnwer);

  List<String> get shuffledData {
    final copiedList = List.of(asnwer);
    copiedList.shuffle();

    return copiedList;
  }
}
