import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/loading.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/views/home/home_screen.dart';
import 'package:amti7ane_unicoding/views/home/subjects_lectures.dart';
import 'package:amti7ane_unicoding/views/profile/profile_screen.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:amti7ane_unicoding/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MainController extends GetxController {
  RxBool insub = false.obs;
  RxBool inQuiz = false.obs;
  RxBool showSolutions = false.obs;

  BottomNavigationController navController = Get.find();
  SubjectsControllers subjectsControllers = Get.find();

  QuizController quizController = Get.find();
  TimerController timerController = Get.find();

  List screens = [
    [
      HomeScreen(),
      const SubjectLectures(),
    ],
    [
      QuizQuestons(),
      const QuizScore(),
      const QuizSolutions(),
    ],
    const ProfileScreen(),
    SettingsScreen(),
  ];

  Widget whichScreen() {
    if (!subjectsControllers.getSubjectsDone.value) {
      subjectsControllers.getDeffultSubjects();
    }
    if (navController.index.value == 0) {
      if (!insub.value) {
        if (subjectsControllers.getSubjectsDone.value) {
          return screens[0][0];
        } else {
          return const MyLoading();
        }
      } else {
        return screens[0][1];
      }
    } else if (navController.index.value == 1) {
      if (inQuiz.value) {
        return screens[1][0];
      } else if (showSolutions.value) {
        return screens[1][2];
      } else {
        return screens[1][1];
      }
    } else {
      return screens[navController.index.value];
    }
  }

  Widget? whichLeading() {
    if (navController.index.value == 0) {
      if (insub.value == true &&
          navController.buttomNavIcons[navController.index.value] == 'Home') {
        return IconButton(
          onPressed: () => insub.value = false,
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
        );
      } else {
        return null;
      }
    }
    if (navController.index.value == 1) {
      if ((inQuiz.value || showSolutions.value) &&
          navController.buttomNavIcons[navController.index.value] == 'Quiz') {
        return IconButton(
          onPressed: () {
            if (inQuiz.value) {
              inQuiz.value = false;
              quizController.resetQuestion();
              timerController.stopTimer();
              timerController.firstTime = true;
              quizController.circleNumber.value = 0;
            } else {
              showSolutions.value = false;
            }
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
        );
      } else {
        return null;
      }
    }
    return null;
  }

  Widget whichTitle() {
    return Padding(
      padding: navController.buttomNavIcons[navController.index.value] == 'Home'
          ? insub.value == true
              ? const EdgeInsets.only(right: 56)
              : EdgeInsets.zero
          : navController.buttomNavIcons[navController.index.value] == 'Quiz'
              ? showSolutions.value == true
                  ? const EdgeInsets.only(right: 56)
                  : EdgeInsets.zero
              : EdgeInsets.zero,
      child: Center(
        child: MyText(
          myText: navController.buttomNavIcons[navController.index.value],
          mysize: 35,
          family: 'Poppins',
        ),
      ),
    );
  }
}
