import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff870DFF),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30))),
      child: Image.asset(
        'assets/images/loginScreenImage.png',
        height: 250,
        width: 284,
      ),
    );
  }
}
