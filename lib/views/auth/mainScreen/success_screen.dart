import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/code_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'login_Screen.dart';


class sucessScreen extends StatelessWidget {
  const sucessScreen({Key? key, required this.title, required this.body, required this.image}) : super(key: key);
  final String title;
  final String body;
  final String image;
  @override
  Widget build(BuildContext context) {
    final from = Get.find<MyControllerAuth>();
    final codeC = Get.find<codeChecker>();
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
    child: Scaffold(

      body: SingleChildScrollView (
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:100),
              child: TextTitle(
                text: '${title}',
                size: 30,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 30),
              constraints:const BoxConstraints(

                maxWidth: 1280,
                minWidth: 1280,
              ),
              child: Image.asset(image,height: 250,width: 284,),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 50,left: 50,right: 50),
              child: MyText_Ahmed(
                  myText: '${body}',
                  mysize: 15,
                  family: 'fonts'.tr),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextButton(
                onPressed: ()  {
                  Get.offAll(() => LoginScreen());
                },
                style: TextButton.styleFrom(
                  primary: MyColor.mainColor,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      color: MyColor.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child:  Text(
                    'back_to_login'.tr,
                    style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'fonts'.tr),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
