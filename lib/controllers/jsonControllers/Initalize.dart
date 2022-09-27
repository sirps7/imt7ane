import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/userController.dart';
import 'package:amti7ane_unicoding/locale/locale_Controller.dart';



import 'code_controller.dart';
import 'stageController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StageController>(StageController());
    Get.put<MyControllerAuth>(MyControllerAuth());
    Get.put<SignInController>(SignInController());
    Get.put<codeChecker>(codeChecker());
    Get.put<MyLocaleController>(MyLocaleController());
  }
}