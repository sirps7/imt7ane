
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/sign_Up_Screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Services/sign_in_remote.dart';



class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final from = Get.find<MyControllerAuth>();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children:  [
          Text('new_signup'.tr,style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            fontFamily: 'fonts'.tr
          ),),
          TextButton(
            onPressed: (){
              from.emailInController.clear();
              from.passwordInController.clear();
              SignInRemote.ed.value='';
              Get.to(()=> const SingUpScreen());

            },
            style: TextButton.styleFrom(
              primary: MyColor.mainColor,
            ),
            child:  Text('signup'.tr,
              style: TextStyle(
                  color: MyColor.mainColor,
                  fontSize: 16,
                fontFamily: 'fonts'.tr
              ),
            ),


          ),      ],
      ),
    );
  }
}
