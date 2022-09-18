import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lecture extends StatelessWidget {
  const Lecture(
      {super.key,
      required this.lecture,
      required this.lectureTitle,
      required this.time,
      required this.questionNo});
  final String lecture;
  final String lectureTitle;
  final int time;
  final int questionNo;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    BottomNavigationController navController = Get.find();
    return GestureDetector(
      onTap: () {
        navController.index.value = 1;
        mainController.inQuiz.value = true;
        TimerController.givenMinutes = time;
      },
      child: SizedBox(
        height: 75,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MyText(
                    myText: lectureTitle,
                    mysize: 17,
                    family: 'SFMarwa',
                  ),
                ),
                Expanded(
                  child: MyText(
                    myText: '$questionNo Questions',
                    mysize: 15,
                  ),
                ),
                Expanded(
                  child: MyText(
                    myText: '$time Mins',
                    mysize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            PurpleContainer(
              withShadow: false,
              H: 75,
              W: 150,
              child: MyText(
                myText: lecture,
                mysize: 23,
                mycolor: Colors.white,
                family: 'SFMarwa',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
