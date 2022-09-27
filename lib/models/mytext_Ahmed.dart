import 'package:flutter/material.dart';

class MyText_Ahmed extends StatelessWidget {
  const MyText_Ahmed({
    super.key,
    required this.myText,
    required this.mysize,
    this.mycolor,
    this.isbold = false,
    this.family = 'Poppins',
    this.height = 0,
    this.lines = 4,
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
