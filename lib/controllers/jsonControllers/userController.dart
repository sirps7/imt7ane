import 'package:amti7ane_unicoding/Services/sign_in_remote.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/models/JsonModels/User.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SignInController extends GetxController {
  static late User user;
  static bool notinilizedUser=false;
  Box auth = Hive.box<dynamic>('auth');
  DropdownButtonController dropdownButtonController =
      Get.put(DropdownButtonController());

  Future<void> sign_in_user(Map data) async {
    try {
      var USER = await SignInRemote.sign_in(data);
      if (USER != null) {
        user = USER;
        notinilizedUser=true;
        auth.put('token', user.token.access);
        Server.setToken(user.token.access);
        auth.put('stage', user.profileOut.stage.stages);
        if(user.profileOut.stage.id>=10){
          dropdownButtonController.selectedItem.value=user.profileOut.stage.stages.split(' ')[0]+' '+user.profileOut.stage.type;
        }
        else{
        dropdownButtonController.selectedItem.value =
            user.profileOut.stage.stages;}
      }
    } finally {}
  }
}
