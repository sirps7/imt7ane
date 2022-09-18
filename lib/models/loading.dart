import 'package:amti7ane_unicoding/models/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitThreeBounce(
      color: MyColor.mainColor,
      size: 25,
    ));
  }
}
