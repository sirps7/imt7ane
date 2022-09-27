
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TextTitle extends StatelessWidget {
   TextTitle({Key? key, required this.text, required this.size}) : super(key: key);
final String text;
final double size;
  @override
  Widget build(BuildContext context) {
    return Text(text.tr,style: TextStyle(
        color: Color(0xff870DFF),
        fontSize: size,
        fontWeight: FontWeight.bold,
        fontFamily: 'fonts'.tr
    ),);
  }
}
