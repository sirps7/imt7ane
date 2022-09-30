import 'package:amti7ane_unicoding/Services/sign_in_remote.dart';
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/jsonControllers/userController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:amti7ane_unicoding/views/auth/forgot_Password_Text.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/logo_Image.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Emaill.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Passwordd.dart';
import 'package:amti7ane_unicoding/views/auth/signup_Text.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';

import '../../../controllers/init_dependency.dart';
import '../../../locale/locale_Controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final from = Get.find<MyControllerAuth>();
  final userC = Get.find<SignInController>();
  MyLocaleController c = Get.find();

  @override
  Widget build(BuildContext context) {
    Box auth = Hive.box<dynamic>('auth');
    return Scaffold(
      body: Obx(() {
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoImage(),
                TextTitle(
                  text: 'login'.tr,
                  size: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyText_Ahmed(
                    myText: '${SignInRemote.ed}',
                    mycolor: Colors.redAccent,
                    mysize: 15,
                  ),
                ),
                Column(
                  children: [
                    MyTextFiledEmaill(thisController: from.emailInController),
                    MyTextFiledPassword(
                        thisController: from.passwordInController,
                        text: 'password',
                        noValid: true),
                    const ForgotPassword(),
                    Container(
                        constraints: const BoxConstraints(
                          maxHeight: 60.0,
                          maxWidth: 150.0,
                          minHeight: 30.0,
                          minWidth: 150.0,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 5, right: 5),
                        decoration: BoxDecoration(
                            color: MyColor.mainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: SignInRemote.isloading.value
                            ? const SpinKitThreeBounce(
                                color: MyColor.w70,
                                size: 20,
                              )
                            : TextButton(
                                child: Text(
                                  'loginn'.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontFamily: 'fonts'.tr),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    var json = {
                                      "email": from.emailInController.text,
                                      "password": from.passwordInController.text
                                    };
                                    await userC.sign_in_user(json);
                                    if (SignInRemote.sc == 200) {
                                      auth.put(
                                          'email', from.emailInController.text);
                                      auth.put('password',
                                          from.passwordInController.text);

                                      SignInRemote.ed.value = '';
                                      Get.offAll(const MainScreen(),binding: InitDep());
                                    }
                                  }
                                },
                              )),
                    const SignUpText(),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
