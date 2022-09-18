import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionCircle extends StatelessWidget {
  const QuestionCircle(
      {super.key, required this.num, required this.isSelected});
  final int num;
  final RxBool isSelected;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected.value ? MyColor.mainColor : Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: MyColor.mainColor,
            width: 2,
          ),
        ),
        child: MyText(
          myText: '$num',
          mysize: 17,
          family: MyFont.poppinsbold,
          mycolor: isSelected.value ? Colors.white : Colors.black,
        ),
      );
    });
  }
}
