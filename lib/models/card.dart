import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/views/home/subjects_lectures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//!subjects card in home screen
class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.subjectIcon,
    required this.subNo,
    required this.subject,
  });
  final String firstText;
  final String secondText;
  final AssetImage subjectIcon;
  final int subNo;
  final String subject;

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();
    final SubjectsControllers subjectsControllers = Get.find();
    // double scrrenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        mainController.insub.value = true;
        SubjectLectures.subIcon = subjectIcon;
        SubjectLectures.subName = subject;
      },
      child: Column(
        children: [
          Container(
            width: 160,
            height: 135,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                //!first elemnt
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyText(
                        myText: firstText,
                        mysize: 17,
                        isbold: true,
                        family: 'SFMarwa',
                      ),
                      MyText(
                        family: 'SFMarwa',
                        myText: '$secondText فصول',
                        mysize: 14,
                        mycolor: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                //!second elemnt
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Image(
                          image: subjectIcon,
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
