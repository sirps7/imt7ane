import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lecture extends StatelessWidget {
  const Lecture({
    super.key,
    required this.lecture,
    required this.lectureTitle,
    required this.time,
    required this.questionNo,
    required this.subName,
    required this.quizId,
  });
  final String lecture;
  final String lectureTitle;
  final int time;
  final int questionNo;
  final String subName;
  final int quizId;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    BottomNavigationController navController = Get.find();
    TimerController timerController = Get.find();
    QuizController quizController = Get.find();
    quizController.firstTime = true;
    return GestureDetector(
      onTap: () async {
        if (quizController.firstTime) {
          navController.index.value = 1;
          mainController.inQuiz.value = true;
          quizController.quizId = quizId;
          await quizController.getQuiz();
          TimerController.givenMinutes = time;
          timerController.refreshTimer();
          QuizQuestons.subjectName = subName;
          quizController.noOfQuestions = NetQuiz.quizquestions.length;
          quizController.addCircles();
          quizController.firstTime = false;
        }
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
