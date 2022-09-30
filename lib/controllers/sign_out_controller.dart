import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/profile_controller.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:get/get.dart';

class signoutC{
  static void deleteDependencies() async {
    Get.delete<SubjectsControllers>();
    Get.delete<SubjectsControllers>();
    Get.delete<MainController>();
    Get.delete<QuizController>();
    Get.delete<ChoiceController>();
    Get.delete<TimerController>();
    Get.delete<SettingController>();
    Get.delete<DropdownButtonController>();
    Get.delete<ProfileController>();
  }
}