import 'package:get/get.dart';

class NetQuiz {
  static List<Map<int, QuizQuastion>> quizquestions = [];
  static fromJson(Map json) {
    for (int i = 0; i < json['q_num']; i++) {
      quizquestions.add(
        {
          i + 1: QuizQuastion(
            isProblem: json['quiz'][i]['Questions']['isProblem'],
            questionBody: json['quiz'][i]['Questions']['questionBody'],
            image: json['quiz'][i]['Questions']['image'],
            questionNo: i + 1,
            choices: json['quiz'][i]['Choices']
                .map(
                  (e) => QuizChoice(
                    questionNo: i + 1,
                    isCorrect: e['isCorrect'],
                    choiceBody: e['choiceBody'],
                  ),
                )
                .toList(),
          )
        },
      );
    }
  }
}

class QuizQuastion {
  QuizQuastion({
    required this.isProblem,
    this.image,
    required this.questionBody,
    required this.questionNo,
    required this.choices,
  });
  final RxString selectedChioce = ''.obs;
  final bool isProblem;
  final String? image;
  final String questionBody;
  final int questionNo;
  final List choices;
}

class QuizChoice {
  QuizChoice({
    required this.questionNo,
    required this.choiceBody,
    required this.isCorrect,
  });
  final int questionNo;
  final String choiceBody;
  final bool isCorrect;
}
