import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/verification_Screen.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Emaill.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Services/send_ver_email_remote.dart';
import '../../../Services/sign_in_remote.dart';
import '../../../controllers/ahmedController/email_Controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final from = Get.find<MyControllerAuth>();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(onWillPop: () {
      SignInRemote.ed.value = '';
      from.verifyEmailController.clear();
      Navigator.pop(context, false);
      return Future.value(false);
    },

        child: Scaffold(
      body: Obx(() {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: SafeArea(
                child: Column(
                  children: [
                     Padding(
                      padding: EdgeInsets.only(top: 50,bottom: 50),
                      child: TextTitle(
                        text: 'forgot'.tr,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                     MyText_Ahmed(
                        myText: 'please_email'.tr,
                        mysize: 15,
                        family: 'fonts'.tr),
                    MyText_Ahmed(
                      myText: '${ver_email_Services.ed}',
                      mycolor: Colors.redAccent,
                      mysize: 15,
                    ),
                    MyTextFiledEmaill(thisController: from.verifyEmailController),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        constraints: const BoxConstraints(
                          maxHeight: 60.0,
                          maxWidth: 150.0,
                          minHeight: 30.0,
                          minWidth: 150.0,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin:
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                            color: MyColor.mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ver_email_Services.isloading.value
                            ? const SpinKitThreeBounce(
                          color: MyColor.w70,
                                size: 20,
                              )
                            : TextButton(
                                child:  Text(
                                  'send'.tr,
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 25,fontFamily: 'fonts'.tr),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    var json = {
                                      "email": "${from.verifyEmailController.text}"
                                    };
                                    await ver_email_Services.send_veri(json);
                                    if (ver_email_Services.sc == 202) {
                                      Get.to(() => VerificationScreen());
                                    }
                                  }
                                },
                              )),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    ));
  }
}
