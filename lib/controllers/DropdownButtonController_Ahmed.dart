import 'package:amti7ane_unicoding/Services/Stage_remote.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/stageController.dart';
import 'package:get/get.dart';

import '../models/JsonModels/stages.dart';

class DropdownButtonController_Ahmed extends GetxController {
  final stagecontroller=Get.put(StageController());



  RxList<String> GanderList = ['male'.tr, 'female'.tr].obs;
  RxString selectedItem1 = 'male'.tr.obs;

  List<String> stageList = [''];
  RxString selectedItem2 = 'اول ابتدائي'.obs;

  String getGender(){
    if (selectedItem1.value=='male'.tr){
      return 'Male';
    }
    else{
      return 'Female';
    }

  }
  @override
  void onInit() {

    stageList=stagecontroller.stage.value.map((e) => e.stage).toList();
    super.onInit();
  }

}