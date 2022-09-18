import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/question_circle.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  Rx<int> circleNumber = 0.obs;
  RxInt index = 0.obs;
  int noOfQuestions = 10;
  final List<QuestionCircle> circles = [];
  ChoiceController choiceController = Get.put(ChoiceController());

  @override
  void onInit() {
    super.onInit();
    addCircles();
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
}
