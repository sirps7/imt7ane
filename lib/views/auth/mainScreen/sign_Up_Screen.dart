import 'dart:ui';

import 'package:amti7ane_unicoding/Services/Sign_up_remote.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController_Ahmed.dart';
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/stageController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/login_Screen.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/success_screen.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Emaill.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Name.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Passwordd.dart';
import 'package:amti7ane_unicoding/views/auth/my_Gender.dart';
import 'package:amti7ane_unicoding/views/auth/my_Stage.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final formKey = GlobalKey<FormState>();
  final from = Get.find<MyControllerAuth>();
  final stageC=Get.find<StageController>();
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
              RemoteServices.ed.value='';
              from.emailController.clear();
              from.passwordController.clear();
              from.passwordReController.clear();
              from.nameController.clear();
              dropC.selectedItem1.value='male'.tr;
              dropC.selectedItem2.value='اول ابتدائي';

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


  DropdownButtonController_Ahmed dropC = Get.put(DropdownButtonController_Ahmed());
  @override
  Widget build(BuildContext context) => WillPopScope(

    onWillPop: () async {

      final shouldPop = await showWarning(context);
      return shouldPop ?? false;
    },
    child:  Scaffold(
      body:
      Obx(() {
        return Form(
          key: formKey,
          child: SingleChildScrollView (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                  padding:  EdgeInsets.only(top:45,bottom: 10),
                  child: TextTitle(text: 'signup'.tr, size: 40),
                ),
                MyText_Ahmed(myText: '${RemoteServices.ed}',mycolor: Colors.redAccent,mysize: 15,),


                MyTextFiledName(),
                MyTextFiledEmaill(thisController: from.emailController),
                MyTextFiledPassword(thisController: from.passwordController, text: 'password',),
                MyTextFiledPassword(thisController: from.passwordReController, text: 're_password'.tr,
                    compareContoller:from.passwordController
                ),
                const MyGender(),
                const MyStage(),

                Obx(() {
                  return Container(
                      constraints: const BoxConstraints(
                        maxHeight: 60.0,
                        maxWidth: 200.0,
                        minHeight: 30.0,
                        minWidth: 150.0,
                      ),
                      padding:const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.symmetric(vertical: 25,horizontal: 5),
                      decoration: BoxDecoration(
                          color: MyColor.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: RemoteServices.isloading.value ?const SpinKitThreeBounce(color: MyColor.w70, size: 20,) :TextButton(
                          child:Text('signupp'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'fonts'.tr),
                      ), onPressed: () async {

                        if (formKey.currentState!.validate()) {
                          // login(from.emailController.text.toString(), from.passwordController.text.toString());
                          var json=
                          {
                            "fullname": from.nameController.text,
                            "email": from.emailController.text,
                            "password1": from.passwordController.text,
                            "password2": from.passwordReController.text,
                            "gender": dropC.selectedItem1.value,
                            "stage": stageC.find_stage(dropC.selectedItem2.value)
                          };
                          await RemoteServices.sign_up(json);
                          if(RemoteServices.sc==202){
                            from.emailController.clear();
                            from.passwordController.clear();
                            from.passwordReController.clear();
                            from.nameController.clear();
                            dropC.selectedItem1.value='male'.tr;
                            dropC.selectedItem2.value='اول ابتدائي';
                            RemoteServices.ed.value='';
                            Get.offAll(()=>  sucessScreen(title: 'title_signup_screen'.tr,body: 'body_signup_screen'.tr, image:'assets/images/sign_Up_Successfully.png',)

                            );

                          }
                        }

                      })
                  );
                }
                ),
              ],
            ),
          ),
        );
      }
      ),
    ),
  );
}
