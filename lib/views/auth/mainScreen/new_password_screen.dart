import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Password.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPassowrdScreen extends StatefulWidget {
  const NewPassowrdScreen({Key? key}) : super(key: key);

  @override
  State<NewPassowrdScreen> createState() => _NewPassowrdScreen();
}

class _NewPassowrdScreen extends State<NewPassowrdScreen> {
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
                  text: 'New Password',
                  size: 35,
                ),
                const SizedBox(
                  height: 150,
                ),
                const MyText(
                    myText: 'Please enter a new password',
                    mysize: 15,
                    family: 'Poppins'),
                const MyTextFiledPass(text: 'Password'),
                const MyTextFiledPass(text: 'Re-Enter Password'),
                const SizedBox(
                  height: 50,
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
                      'Continue',
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
