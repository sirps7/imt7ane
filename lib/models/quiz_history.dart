import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';

class QuizHistory extends StatelessWidget {
  const QuizHistory(
      {super.key,
      required this.created,
      required this.subject,
      required this.chapter,
      required this.score});

  final String created;
  final String subject;
  final String chapter;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: MyColor.secounderyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  myText: 'التاريخ',
                  mysize: 20,
                  family: 'SFMarwa',
                  mycolor: Colors.white,
                ),
                MyText(
                  myText: created,
                  mysize: 16,
                  mycolor: Colors.white,
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  myText: 'المادة',
                  mysize: 20,
                  family: 'SFMarwa',
                  mycolor: Colors.white,
                ),
                MyText(
                  myText: subject,
                  mysize: 16,
                  mycolor: Colors.white,
                  family: 'SFMarwa',
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  myText: 'الفصل',
                  mysize: 20,
                  family: 'SFMarwa',
                  mycolor: Colors.white,
                ),
                MyText(
                  myText: chapter,
                  mysize: 16,
                  mycolor: Colors.white,
                  family: 'SFMarwa',
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyText(
                  myText: 'النتيجه',
                  mysize: 20,
                  family: 'SFMarwa',
                  mycolor: Colors.white,
                ),
                MyText(
                  myText: score,
                  mysize: 16,
                  mycolor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
