import 'dart:async';

import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/models/Colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz_history.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  static int givenMinutes = 00;
  static int givenHours = 00;
  static int givenSeconds = 00;
  Timer? timer;
  bool firstTime = true;

  static Duration duration = Duration(hours: givenHours, minutes: givenMinutes);
  static String towDigit(int n) => n.toString().padLeft(2, '0');
  RxString seconds = towDigit(givenSeconds).obs;
  RxString minutes = towDigit(givenMinutes).obs;
  RxString hours = towDigit(givenHours).obs;

  addTime() {
    const addenTime = 1;
    int secound = duration.inSeconds - addenTime;
    duration = Duration(seconds: secound);

    if (duration.inSeconds < 0) {
      QuizController quizController = Get.find();
      MainController mainController = Get.find();
      BottomNavigationController navController = Get.find();
      TimerController timerController = Get.find();
      timer!.cancel();
      Get.defaultDialog(
        barrierDismissible: false,
        radius: 12,
        titlePadding: const EdgeInsets.all(10),
        title: 'time out your score is ${quizController.score}',
        confirm: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextButton(
            style: TextButton.styleFrom(
              primary: MyColor.milk,
              backgroundColor: MyColor.mainColor,
            ),
            onPressed: () {
              quizController.sendQuiz();
              mainController.inQuiz.value = false;
              navController.index.value = 1;
              quizController.resetQuestion();
              timerController.stopTimer();
              timerController.firstTime = true;
              quizController.circleNumber.value = 0;
              quizController.circles = [];
              quizController.currentQuestionIndecator.value = 1;
              quizController.saveLastQuizScore();
              QuizSolutions.lectureName = QuizQuestons.lecture;
              QuizSolutions.subjectName = QuizQuestons.subName;
              QuizScore.lecture = QuizQuestons.lecture;
              QuizScore.subName = QuizQuestons.subName;
              History.historyList = [];
              quizController.getQuizesHistoryWithAvgAndTotal();
              quizController.thereIsNoScore.value = false;
              Get.back();
            },
            child: const MyText(
              myText: 'OK',
              mysize: 15,
              mycolor: Colors.white,
              family: MyFont.poppinsMedium,
            ),
          ),
        ),
        middleText: '',
      );
    } else {
      seconds.value = towDigit(duration.inSeconds.remainder(60));
      minutes.value = towDigit(duration.inMinutes.remainder(60));
      hours.value = towDigit(duration.inHours.remainder(60));
    }
  }

  startTimer() {
    if (firstTime) {
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        addTime();
        firstTime = false;
      });
    }
  }

  void stopTimer() {
    timer!.cancel();
    duration = Duration(hours: givenHours, minutes: givenMinutes);
    seconds.value = towDigit(givenSeconds);
    minutes.value = towDigit(givenMinutes);
    hours.value = towDigit(givenHours);
  }

  void refreshTimer() {
    duration = Duration(hours: givenHours, minutes: givenMinutes);
    seconds.value = towDigit(givenSeconds);
    minutes.value = towDigit(givenMinutes);
    hours.value = towDigit(givenHours);
  }
}
