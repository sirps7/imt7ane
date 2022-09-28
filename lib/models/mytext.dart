import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.myText,
    required this.mysize,
    this.mycolor,
    this.isbold = false,
    this.family = 'fonts',
    this.height = 0,
    this.lines = 2,
    this.align = TextAlign.center,
    this.direction,
    this.defflutDirection = true,
    this.overFlow,
  });

  final String myText;
  final double mysize;
  final double? height;
  final Color? mycolor;
  final bool isbold;
  final bool defflutDirection;
  final String family;
  final int lines;
  final TextAlign? align;
  final TextDirection? direction;
  final TextOverflow? overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection: defflutDirection
          ? family == MyFont.arabic
              ? TextDirection.rtl
              : TextDirection.ltr
          : direction,
      myText,
      style: TextStyle(
        fontWeight: isbold ? FontWeight.w400 : FontWeight.normal,
        fontSize: mysize,
        color: mycolor,
        fontFamily: family.tr,
        height: height,
      ),
      maxLines: lines,
      textAlign: align,
      overflow: overFlow,
    );
  }
}
