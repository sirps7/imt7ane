import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class DropdownButtonController extends GetxController {
  RxBool getstagesDone = false.obs;
  RxList<String> stageList = <String>[].obs;
  RxString selectedItem = ''.obs;
  RxString settingSelectedItem = ''.obs;
  Future<void> getStages() async {
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getStagesPath,
      options: Server.token,
    );
    Stages.fromJson(response.data);
    getstagesDone.value = true;
  }
}
