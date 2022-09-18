import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;
  double max = 37;
  double min = 28;
  RxString genderSelectedItem = 'Male'.obs;

  List<String> buttomNavIcons = [
    'Home',
    'Quiz',
    'profile',
    'settings',
  ];
  List<String> buttomNavSettingsGender = [
    'Male',
    'Female',
  ];

  void iconNac(int vlaue) {
    index.value = vlaue;
  }
}
