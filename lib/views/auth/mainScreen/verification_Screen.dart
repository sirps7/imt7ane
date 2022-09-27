import 'dart:ui';

import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/code_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/login_Screen.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/utlites.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../Services/check_code_remote.dart';
import 'package:get/get.dart';

import 'new_password_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final from = Get.find<MyControllerAuth>();
  final codeC = Get.find<codeChecker>();
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: MyColor.mainColor,
        shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        title:  Text(
          'exit'.tr,
          style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
        ),
        actions: [
          TextButton(
            child:  Text(
              'no'.tr,
              style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            onPressed: () {
              from.code.clear();
              from.verifyEmailController.clear();
              code_Services.ed.value='';
              Get.offAll(() => LoginScreen());
            },
            child:  Text(
              'yes'.tr,
              style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async {

      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    },
    child: Scaffold(

      body: Obx(() {
        return ListView(
          children: [
            Form(
              child: Column(
                children: [
                   Padding(
                    padding: EdgeInsets.only(top:50.0,bottom: 150),
                    child: TextTitle(
                      text: 'verify_code'.tr,
                      size: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: MyText_Ahmed(myText: '${code_Services.ed}',mycolor: Colors.redAccent,mysize: 15,),
                  ),
                  // const MyTextFieldCode(), //Ali
                  Pinput(
                    keyboardType: TextInputType.text,
                    controller:from.code ,
                    defaultPinTheme: defaultPinTheme,
                    // focusedPinTheme: focusedPinTheme,
                    // submittedPinTheme: submittedPinTheme,
                    pinAnimationType: PinAnimationType.fade,
                    closeKeyboardWhenCompleted: true,
                    length: 5,
                    separator: Container(
                      height: 64,
                      width: 1,
                      color: Colors.white,
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      height: 68,
                      width: 64,
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: MyColor.mainColor),
                      ),
                    ),
                    errorPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: MyColor.yColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                      onPressed: () async {
                        var json={
                          "code": from.code.text,
                          "email": from.verifyEmailController.text
                        };
                        await code_Services.checkCode(json);
                        if (code_Services.sc==200){
                          Get.offAll(() => NewPassowrdScreen());
                          from.code.clear();
                          from.verifyEmailController.clear();
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: MyColor.mainColor,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: MyColor.mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: code_Services.isloading.value ? const SpinKitThreeBounce(
                          color: MyColor.w70,
                          size: 20,
                        ): Text(
                          'verification'.tr,
                          style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'fonts'.tr),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      ),
    ),
  );
}
