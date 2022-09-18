import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/forgot_Password_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: TextButton(
        onPressed: () {
          Get.to(() => const ForgotPasswordScreen());
        },
        style: TextButton.styleFrom(
          foregroundColor: MyColor.mainColor,
        ),
        child: const Text(
          'Forgot your password?',
          style: TextStyle(color: MyColor.mainColor, fontSize: 12),
        ),
      ),
    );
  }
}
