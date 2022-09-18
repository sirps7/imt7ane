import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.myText,
    required this.mysize,
    this.mycolor,
    this.isbold = false,
    this.family = 'Poppins',
    this.height = 0,
    this.lines = 2,
    this.align = TextAlign.center,
  });

  final String myText;
  final double mysize;
  final double? height;
  final Color? mycolor;
  final bool isbold;
  final String family;
  final int lines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      textDirection:
          family == MyFont.arabic ? TextDirection.rtl : TextDirection.ltr,
      myText,
      style: TextStyle(
        fontWeight: isbold ? FontWeight.w400 : FontWeight.normal,
        fontSize: mysize,
        color: mycolor,
        fontFamily: family,
        height: height,
      ),
      maxLines: lines,
      textAlign: align,
    );
  }
}
