import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/views/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => MainScreen());
      },
      style: TextButton.styleFrom(
        foregroundColor: MyColor.mainColor,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: MyColor.mainColor, borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
