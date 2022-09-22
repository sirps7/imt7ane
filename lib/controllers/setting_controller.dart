import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/profileInfo.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:dio/dio.dart';

class SettingController extends GetxController {
  RxBool profilebutton = false.obs;
  RxBool updateProfileDone = true.obs;
  RxBool languagebutton = false.obs;
  RxString language = 'EN'.obs;
  BottomNavigationController buttomNavController = Get.find();
  DropdownButtonController dropdownButtonController = Get.find();
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

//!  settings data
  @override
  void onInit() async {
    await getProgileInfo();
    buttomNavController.genderSelectedItem.value = ProfileInfo.studentGender!;
    dropdownButtonController.settingSelectedItem.value = ProfileInfo.stageNsme!;
    super.onInit();
  }

  Future<void> getProgileInfo() async {
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getProfileInfoPath,
      options: Server.token,
    );
    ProfileInfo.fromjason(response.data);
  }

  Future<void> sendSettingChange(
    String name,
    String gender,
    int stageId,
    String stageName,
  ) async {
    updateProfileDone.value = false;
    await Server.dio.post(
      Server.baseUrl + Server.sendSettingChangePath,
      options: Server.token,
      data: {
        "name": name,
        "stage_id": stageId,
        "stage_name": stageName,
        "gender": gender,
      },
    );
    updateProfileDone.value = true;
    Get.showSnackbar(const GetSnackBar(
      duration: Duration(seconds: 1),
      snackPosition: SnackPosition.TOP,
      backgroundColor: MyColor.borderColor,
      messageText: MyText(
        myText: 'profile updated succfully',
        mysize: 20,
        mycolor: Colors.white,
      ),
    ));
  }
}
