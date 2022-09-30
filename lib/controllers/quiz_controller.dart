import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';

import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/quiz_history.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:amti7ane_unicoding/models/question_circle.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class QuizController extends GetxController {
  RxString dialogTC = ('exit'.tr).obs;
  RxBool isTrue = false.obs;
  RxBool isFalse = false.obs;
  Rx<Color> con_color = Colors.grey.shade300.obs;
  RxBool playShake = false.obs;
  // RxBool thereIsNoScore = true.obs;
  RxInt avg = 0.obs;
  RxInt total = 0.obs;
  RxInt score = 0.obs;
  RxInt correctAnswer = 0.obs;
  RxInt last_correctAnswer = 0.obs;
  RxInt inCorrectAnswer = 0.obs;
  RxInt last_incorrectAnswer = 0.obs;
  int lastQuizscore = 0;
  bool deffult = true;
  int quizSubjectNO = 0;
  int quizId = 0;
  RxBool Correctvisiblity = false.obs;
  RxDouble fadedCorrectColorOpt = (1.0).obs;
  bool firstTime = true;
  RxDouble fadedCorrectPoints = (40.0).obs;
  RxInt currentQuestionIndecator = 1.obs;
  RxBool getDeffultQuizesDone = false.obs;
  RxBool getQuizDone = false.obs;
  Rx<int> circleNumber = 0.obs;
  RxInt index = 0.obs;
  int noOfQuestions = 0;
  List<QuestionCircle> circles = [];
  ChoiceController choiceController = Get.find();
  DropdownButtonController dropController = Get.find();
  Box saveScoreLocal = Hive.box<dynamic>('lastQuizScore');
  Box saveQuestionsLocal = Hive.box<dynamic>('lastQuestions');
  @override
  void onInit() async {
    getQuizesHistoryWithAvgAndTotal();

    if (saveQuestionsLocal.get('last_questions') != null) {
      NetQuiz.quizquestions = saveQuestionsLocal.get('last_questions');
      last_incorrectAnswer.value =
          await saveScoreLocal.get('last_incorrectAnswer');
      last_correctAnswer.value = await saveScoreLocal.get('last_correctAnswer');
      lastQuizscore = await saveScoreLocal.get('last_score');
      QuizSolutions.lectureName = await saveScoreLocal.get('last_lecture');
      QuizSolutions.subjectName = await saveScoreLocal.get('last_subName');
      QuizScore.lecture = QuizSolutions.lectureName;
      QuizScore.subName = QuizSolutions.subjectName;
    }

    super.onInit();
  }

  void saveLastQuizScore() {
    lastQuizscore = score.value;
    score.value = 0;
  }

  void addCircles() {
    for (int i = 1; i <= noOfQuestions; i++) {
      circles.add(
        QuestionCircle(
          num: i,
          isSelected: false.obs,
        ),
      );
    }
    circles[index.value].isSelected.value = true;
  }

  void nextQuestion() {
    if (index < noOfQuestions - 1) {
      circles[index.value].isSelected.value = false;
      index++;
      circles[index.value].isSelected.value = true;
    }
  }

  void resetQuestion() {
    circles[index.value].isSelected.value = false;
    index.value = 0;
    circles[index.value].isSelected.value = true;
  }

//! lecture quizes not actual quizes
  Future<void> getDeffultQuizes() async {
    getDeffultQuizesDone.value = false;
    Response response = await Server.dio.post(
        Server.baseUrl + Server.getDeffultQuizesPath,
        queryParameters: {'sub': quizSubjectNO},
        options: Server.token);
    Quizes.fromJson(response.data);
    getDeffultQuizesDone.value = true;
  }

  Future<void> getQuizesWithId() async {
    getDeffultQuizesDone.value = false;
    Response response =
        await Server.dio.post(Server.baseUrl + Server.getQuizesPath,
            queryParameters: {
              'sub': quizSubjectNO,
              'stage': (Stages.stagesMap.firstWhere(
                      (e) => e.containsKey(dropController.selectedItem.value)))[
                  dropController.selectedItem.value]!
            },
            options: Server.token);
    Quizes.fromJson(response.data);
    getDeffultQuizesDone.value = true;
  }

//! get actual quiz questions with choices
  Future<void> getQuiz() async {
    getQuizDone.value = false;
    Response response = await Server.dio.get(
        Server.baseUrl + Server.getQuizPath,
        queryParameters: {'quizid': quizId},
        options: Server.token);
    NetQuiz.fromJson(response.data);
    getQuizDone.value = true;
  }

  Future<void> sendQuiz() async {
    await Server.dio.post(
      Server.baseUrl + Server.sendQuizpath,
      options: Server.token,
      data: {
        "quiz_id": quizId,
        "created": DateFormat('yy/MM/dd KK:mm:ss a').format(DateTime.now()),
        "score": score.value,
      },
    );
  }

  Future<void> getQuizesHistoryWithAvgAndTotal() async {
    Response historyResponse = await Server.dio.get(
      Server.baseUrl + Server.getQuizesHistoryPath,
      options: Server.token,
    );
    Response avgTotalResponse = await Server.dio
        .get(Server.baseUrl + Server.getAvgAndTotalPath, options: Server.token);
    StudentHistory.fromJson(historyResponse.data);
    total.value = avgTotalResponse.data['total'];
    avg.value = avgTotalResponse.data['avg'];
  }
}
