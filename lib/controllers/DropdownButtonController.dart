import 'dart:convert';

import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class DropdownButtonController extends GetxController {
  List<String> ganderList = ['Male', 'Female'];
  RxString selectedItem1 = 'Male'.obs;
  Dio dio = Dio();

  RxList<String> stageList = <String>[].obs;
  // List<String> stageList = ['اول متوسط', 'ثاني متوسط', 'ثالث متوسط'];
  RxString selectedItem = 'اول ابتدائي'.obs;

  Future<void> getStages() async {
    Response response = await dio.get(Server.baseUrl + Server.getStagesPath);
    Stages.fromJson(jsonDecode(response.toString()));
  }
}
