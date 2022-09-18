import 'package:get/get.dart';

class SettingController extends GetxController {
  RxBool profilebutton = false.obs;
  RxBool languagebutton = false.obs;
  RxString language = 'EN'.obs;
  void toogleprofile() {
    profilebutton.value = !profilebutton.value;
  }

  void tooglelanguageButton() {
    languagebutton.value = !languagebutton.value;
  }

  void tooglelanguage() {
    if (language.value == 'EN') {
      language.value = 'AR';
    } else {
      language.value = 'EN';
    }
  }
}
