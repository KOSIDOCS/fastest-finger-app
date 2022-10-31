class Question {
  final String question;
  final String answer;
  final num answerValue;

  Question({
    required this.question,
    required this.answer,
    required this.answerValue,
  });
}

class QuestionAnswered {
  final String question;
  final String answer;
  final num answerValue;
  final num yourAnswerValue;
  final String wonBy;
  final bool won;
  final int timeTaken;
  final int score;
  final int questionNumber;
  final int totalQuestions;
  final int timeTakenByOpponent;

  QuestionAnswered({
    required this.question,
    required this.answer,
    required this.answerValue,
    required this.yourAnswerValue,
    required this.wonBy,
    required this.won,
    required this.timeTaken,
    required this.score,
    required this.questionNumber,
    required this.totalQuestions,
    required this.timeTakenByOpponent,
  });
}
