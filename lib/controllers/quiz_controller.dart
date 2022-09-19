import 'dart:convert';

import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/question_circle.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class QuizController extends GetxController {
  RxBool getDeffultQuizesDone = false.obs;
  Dio dio = Dio();
  Rx<int> circleNumber = 0.obs;
  RxInt index = 0.obs;
  int noOfQuestions = 10;
  List<QuestionCircle> circles = [];
  ChoiceController choiceController = Get.find();

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

  void getDeffultQuizes() async {
    Response response = await dio.get(
      Server.baseUrl + Server.getDeffultQuizesPath,
      queryParameters: {'sub': 2},
    );
    Quizes.fromJson(jsonDecode(response.toString()));
    getDeffultQuizesDone.value = true;
  }
}
