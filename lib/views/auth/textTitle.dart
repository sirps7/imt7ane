import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({Key? key, required this.text, required this.size})
      : super(key: key);
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: const Color(0xff870DFF),
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}
