import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/new_password_screen.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Email.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const TextTitle(
                  text: 'Forgot your passowrd',
                  size: 35,
                ),
                const SizedBox(
                  height: 150,
                ),
                const MyText(
                    myText: 'Please enter your email address',
                    mysize: 15,
                    family: 'Poppins'),
                const MyTextFiledEmail(text: ''),
                const SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(() => const NewPassowrdScreen());
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: MyColor.mainColor,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: MyColor.mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
