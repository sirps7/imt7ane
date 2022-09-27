import 'dart:ui';

import 'package:amti7ane_unicoding/Services/set_new_password_remote.dart';
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/success_screen.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Passwordd.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewPassowrdScreen extends StatefulWidget {
  const NewPassowrdScreen({Key? key}) : super(key: key);

  @override
  State<NewPassowrdScreen> createState() => _NewPassowrdScreen();
}

class _NewPassowrdScreen extends State<NewPassowrdScreen> {
  final formKey = GlobalKey<FormState>();
  final from = Get.find<MyControllerAuth>();

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
                  from.verifyPassword1Controller.clear();
                  from.verifyPassword2Controller.clear();
                  NewPasswordServices.ed.value='';
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
          print('Back Button pressed!');
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Obx(() {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                     TextTitle(
                      text: 'new_password'.tr,
                      size: 35,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    MyText_Ahmed(
                        myText: 'please_enter_newpass'.tr,
                        mysize: 15,
                        family: 'fonts'.tr),
                    MyText_Ahmed(
                      myText: '${NewPasswordServices.ed}',
                      mycolor: Colors.redAccent,
                      mysize: 15,
                    ),
                    MyTextFiledPassword(
                        thisController: from.verifyPassword1Controller,
                        text: 'password'.tr),
                    MyTextFiledPassword(
                        thisController: from.verifyPassword2Controller,
                        text: 're_password'.tr,
                    // compareContoller:from.verifyPassword1Controller
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          var json = {
                            "password1": from.verifyPassword1Controller.text,
                            "password2": from.verifyPassword2Controller.text
                          };
                          await NewPasswordServices.set_password(json);
                          if (NewPasswordServices.sc == 200) {
                            from.verifyPassword1Controller.clear();
                            from.verifyPassword2Controller.clear();
                            NewPasswordServices.ed.value='';
                            Get.offAll( sucessScreen(
                              title: 'title_new_password'.tr,
                              body:
                                  'body_new_password'.tr,
                              image: 'assets/images/new_Password.png',
                            ));
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        primary: MyColor.mainColor,
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: MyColor.mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: NewPasswordServices.isloading.value
                            ? const SpinKitThreeBounce(
                                color: MyColor.w70,
                                size: 20,
                              )
                            :  Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25,fontFamily: 'fonts'.tr),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
}
