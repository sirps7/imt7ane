import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;
  double max = 37;
  double min = 28;
  RxString genderSelectedItem = 'Male'.obs;

  List<String> buttomNavIcons = [
    'home'.tr,
    'quiz'.tr,
    'profile'.tr,
    'settings'.tr,
  ];
  List<String> buttomNavSettingsGender = [
    'Male',
    'Female',
  ];

  void iconNac(int vlaue) {
    index.value = vlaue;
  }
}
