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
    } else if(settingController.language.value == 'ar') {
      return arabicTitleList;
    }
    else{
      if((Get.deviceLocale!.toString())=='en_US'){
        settingController.language.value='en';
      return englishTitleList;}
      else{
        settingController.language.value='ar';

        return arabicTitleList;
      }
    }
  }

  String titleCondtionText(String a) {
    SettingController settingController = Get.find();
    if (settingController.language.value == 'en') {
      return a;
    } else {
      if (a == 'Home') {
        return 'الرئيسية';
      } else if (a == 'Quiz') {
        return 'اختبار';
      } else if (a == 'Profile') {
        return 'الملف الشخصي';
      } else {
        return 'الإعدادات';
      }
    }
  }

  List<String> englishTitleList = [
    'Home',
    'Quiz',
    'Profile',
    'Settings',
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
