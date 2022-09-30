import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:amti7ane_unicoding/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyLocaleController extends GetxController {
  bool isiniilized = false;
  Locale intiallang = sharepref.getString('lang') == null
      ? Get.deviceLocale!
      : Locale(sharepref.getString('lang')!);

//en_US   device
  void changelang(String codelang) {
    Locale local = Locale(codelang);
    sharepref.setString('lang', codelang);
    Get.updateLocale(local);
  }
}
