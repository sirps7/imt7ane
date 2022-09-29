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

class InitDep implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SubjectsControllers());
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => QuizController());
    Get.lazyPut(() => ChoiceController());
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => DropdownButtonController());
    Get.lazyPut(() => DropdownButtonController());
    Get.lazyPut(() => ProfileController());
  }
}
