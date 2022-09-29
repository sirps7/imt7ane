import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'quiz.g.dart';

class NetQuiz {
  static List<dynamic> quizquestions = [];
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

@HiveType(typeId: 0, adapterName: 'QuizQuastionAdapter')
class QuizQuastion extends HiveObject {
  QuizQuastion({
    required this.isProblem,
    this.image = '',
    required this.questionBody,
    required this.questionNo,
    required this.choices,
  });
  @HiveField(0)
  final RxString selectedChioce = ''.obs;
  @HiveField(1)
  final bool isProblem;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String questionBody;
  @HiveField(4)
  final int questionNo;
  @HiveField(5)
  final List choices;
}

@HiveType(typeId: 1, adapterName: 'QuizChoiceAdapter')
class QuizChoice extends HiveObject {
  QuizChoice({
    required this.questionNo,
    required this.choiceBody,
    required this.isCorrect,
  });
  @HiveField(0)
  final int questionNo;
  @HiveField(1)
  final String choiceBody;
  @HiveField(2)
  final bool isCorrect;
}
