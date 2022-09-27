
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/forgot_Password_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/sign_in_remote.dart';



class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final from = Get.find<MyControllerAuth>();
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: TextButton(
        onPressed: (){
          from.emailInController.clear();
          from.passwordInController.clear();
          SignInRemote.ed.value='';
          Get.to(()=>  ForgotPasswordScreen());
        },
        style: TextButton.styleFrom(
          primary: MyColor.mainColor,
        ),
        child:   Text('forgot'.tr,
          style: TextStyle(
            color: MyColor.mainColor,
            fontSize: 15,
            fontFamily: 'fonts'.tr
        ),
        ),
      ),
    );
  }
}