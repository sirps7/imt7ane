import 'package:amti7ane_unicoding/models/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key, this.mycolor = MyColor.mainColor});
  final Color mycolor;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
      color: mycolor,
      size: 25,
    ));
  }
}
