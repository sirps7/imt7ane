import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:amti7ane_unicoding/models/question_circle.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class QuizController extends GetxController {
  RxInt score = 0.obs;
  int lastQuizscore = 0;
  bool deffult = true;
  int quizSubjectNO = 0;
  int quizId = 0;
  bool firstTime = true;

  RxInt currentQuestionIndecator = 1.obs;
  RxBool getDeffultQuizesDone = false.obs;
  RxBool getQuizDone = false.obs;
  Rx<int> circleNumber = 0.obs;
  RxInt index = 0.obs;
  int noOfQuestions = 0;
  List<QuestionCircle> circles = [];
  ChoiceController choiceController = Get.find();
  DropdownButtonController dropController = Get.find();

  @override
  void onInit() {
    getQuizesHistory();
    // print(DateTime.now());
    super.onInit();
  }

  void saveLastQuizScore() {
    lastQuizscore = score.value;
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
        "created": DateTime.now().toString(),
        "score": score.value,
      },
    );
  }

  Future<void> getQuizesHistory() async {
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getQuizesHistoryPath,
      options: Server.token,
    );
    print(response.data);
  }
}
