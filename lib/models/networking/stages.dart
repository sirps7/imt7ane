import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:get/get.dart';

class Stages {
  static List<Map<String, int>> stagesMap = [];
  static DropdownButtonController dropdownButtonController = Get.find();

  static void fromJson(List json) {
    for (var Map in json) {
      stagesMap.add({Map['stage']: Map['id']});
      dropdownButtonController.stageList.add(Map['stage']);
    }
  }
  // static void getOld(){
  //   for (var a in stagesMap) {
  //     a.keys.forEach((v) =>
  //         dropdownButtonController.stageList.add(v));
  //   }
  //   print(dropdownButtonController.stageList);

  // }

}
