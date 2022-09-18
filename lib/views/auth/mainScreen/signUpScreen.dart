import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Email.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Name.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Password.dart';
import 'package:amti7ane_unicoding/views/auth/my_Gender.dart';
import 'package:amti7ane_unicoding/views/auth/my_Stage.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const TextTitle(text: 'Sign Up', size: 40),
                const MyTextFiledName(
                    text: 'Name', myPrefixIcon: Icons.person_outline),
                const MyTextFiledEmail(text: 'Email Address'),
                const MyTextFiledPass(text: 'Password'),
                const MyTextFiledPass(text: 'Re-Enter Password'),
                const MyGender(),
                const MyStage(),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
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
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
