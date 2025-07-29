class Question {
  const Question({
    required this.txt,
    required this.answers,
  });

  final String txt;
  final List<String> answers;
  
  List<String> getShuffledAnswers(){
    final shuffeld = List.of(answers);
    shuffeld.shuffle();
    return shuffeld;
  }
}
