
import 'package:amti7ane_unicoding/Services/sign_in_remote.dart';
import 'package:amti7ane_unicoding/models/JsonModels/User.dart';

import 'package:get/get.dart';



class SignInController extends GetxController{
  late User user;


  Future<void> sign_in_user(Map data)  async {
    try {
      var USER = await SignInRemote.sign_in(data);
      if (USER != null) {
        user = USER;
      }
    } finally {
    }

  }

}