import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

import '../models/JsonModels/User.dart';
import '../models/JsonModels/User.dart';
import 'jsonControllers/userController.dart';

class DropdownButtonController extends GetxController {
  @override
  void onInit() {
    print(SignInController.notinilizedUser);
    if(SignInController.notinilizedUser==true){
      Server.userToken=SignInController.user.token.access;
    selectedItem.value=SignInController.user.profileOut.stage.stages;
    print(selectedItem.value);}
    super.onInit();
  }
  RxBool getstagesDone = false.obs;
  RxList<String> stageList = <String>[].obs;
  RxString selectedItem = ''.obs;
  RxString settingSelectedItem = ''.obs;
  Future<void> getStages() async {
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getStagesPath,
      options: Server.token,
    );
    if (Stages.stagesMap.isEmpty){
    Stages.fromJson(response.data);}
    else{
      for (var a in Stages.stagesMap) {
            a.keys.forEach((v) =>
                stageList.add(v));
          }
    }
    print(Stages.stagesMap);

    print(stageList);

    // print(stageList);
    getstagesDone.value = true;
  }
}
