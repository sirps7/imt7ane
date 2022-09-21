import 'dart:convert';
import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/question_circle.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class QuizController extends GetxController {
  int quizSubjectNO = 0;
  int quizId = 0;

  RxInt currentQuestionIndecator = 1.obs;
  RxBool getDeffultQuizesDone = false.obs;
  RxBool getQuizDone = false.obs;
  Rx<int> circleNumber = 0.obs;
  RxInt index = 0.obs;
  int noOfQuestions = 0;
  List<QuestionCircle> circles = [];
  ChoiceController choiceController = Get.find();

  // @override
  // void onInit() {
  //   testQuiz();
  //   super.onInit();
  // }

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
    choiceController.selectedChoice.value = '';
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

  // Future<void> testQuiz() async {
  //   Response response = await Server.dio.get(
  //       Server.baseUrl1 + Server.getQuizPath,
  //       queryParameters: {'quizid': quizId},
  //       options: Server.token);
  // }
}
