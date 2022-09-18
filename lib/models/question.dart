import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(
      {super.key,
      required this.questionNo,
      required this.questionBody,
      this.isSolution = false});
  final String questionBody;
  final int questionNo;
  final bool isSolution;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 3,
              blurRadius: 10,
            )
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              isSolution
                  ? MyText(myText: 'Question #$questionNo', mysize: 20)
                  : const Align(),
              MyText(
                myText: questionBody,
                mysize: 19,
                family: MyFont.arabic,
                lines: 20,
                align: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
