import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/auth/forgot_Password_Text.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/logo_Image.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Email.dart';
import 'package:amti7ane_unicoding/views/auth/myTextField/my_Text_Field_Password.dart';
import 'package:amti7ane_unicoding/views/auth/signup_Text.dart';
import 'package:amti7ane_unicoding/views/auth/textTitle.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xff870DFF),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: const Color(0xff870DFF),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const LogoImage(),
                const TextTitle(
                  text: 'Login',
                  size: 40,
                ),
                const MyTextFiledEmail(text: 'Email Address'),
                const MyTextFiledPass(text: 'Password'),
                const ForgotPassword(),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()));
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
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SignUpText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
