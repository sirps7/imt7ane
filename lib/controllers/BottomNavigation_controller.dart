import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt index = 0.obs;
  double max = 37;
  double min = 28;
  RxString genderSelectedItem = ''.obs;

  List<String> titleLanguage() {
    SettingController settingController = Get.find();
    if (settingController.language.value == 'en') {
      return englishTitleList;
    } else {
      return arabicTitleList;
    }
  }

  String titleCondtionText(String a) {
    SettingController settingController = Get.find();
    if (settingController.language.value == 'en') {
      return a;
    } else {
      if (a == 'home') {
        return 'الرئيسية';
      } else if (a == 'quiz') {
        return 'اختبار';
      } else if (a == 'profile') {
        return 'الملف الشخصي';
      } else {
        return 'الإعدادات';
      }
    }
  }

  List<String> englishTitleList = [
    'home',
    'quiz',
    'profile',
    'settings',
  ];
  List<String> arabicTitleList = [
    'الرئيسية',
    'اختبار',
    'الملف الشخصي',
    'الإعدادات',
  ];
  List<String> buttomNavSettingsGender = [
    'Male',
    'Female',
  ];

  void iconNac(int vlaue) {
    index.value = vlaue;
  }
}
