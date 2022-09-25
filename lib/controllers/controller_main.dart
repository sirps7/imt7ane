import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/loading.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/views/home/home_screen.dart';
import 'package:amti7ane_unicoding/views/home/subjects_lectures.dart';
import 'package:amti7ane_unicoding/views/profile/profile_screen.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:amti7ane_unicoding/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool insub = false.obs;
  RxBool inQuiz = false.obs;
  RxBool showSolutions = false.obs;

  BottomNavigationController navController = Get.find();
  SubjectsControllers subjectsControllers = Get.find();
  QuizController quizController = Get.find();
  TimerController timerController = Get.find();
  DropdownButtonController dropdownButtonController = Get.find();

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
    if (!dropdownButtonController.getstagesDone.value &&
        !subjectsControllers.getSubjectsDone.value &&
        navController.index.value == 0) {
      dropdownButtonController.getStages();
      subjectsControllers.getDeffultSubjects();
    }

    if (navController.index.value == 0) {
      if (!insub.value) {
        if (subjectsControllers.getSubjectsDone.value &&
            dropdownButtonController.getstagesDone.value) {
          return screens[0][0];
        } else {
          return const MyLoading();
        }
      } else {
        if (quizController.getDeffultQuizesDone.value) {
          return screens[0][1];
        } else {
          return const MyLoading();
        }
      }
    } else if (navController.index.value == 1) {
      if (inQuiz.value) {
        if (quizController.getQuizDone.value) {
          return screens[1][0];
        } else {
          return const MyLoading();
        }
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
          onPressed: () {
            insub.value = false;
            Quizes.quizesList = [];
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
    if (navController.index.value == 1) {
      if ((inQuiz.value || showSolutions.value) &&
          navController.buttomNavIcons[navController.index.value] == 'Quiz') {
        return IconButton(
          onPressed: () {
            if (inQuiz.value) {
              Get.defaultDialog(
                barrierDismissible: false,
                radius: 12,
                titlePadding: const EdgeInsets.all(10),
                title: 'Are you sure you want to quit ?',
                confirm: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: MyColor.milk,
                      backgroundColor: MyColor.mainColor,
                    ),
                    onPressed: () {
                      inQuiz.value = false;
                      navController.index.value = 0;
                      quizController.resetQuestion();
                      timerController.stopTimer();
                      timerController.firstTime = true;
                      quizController.circleNumber.value = 0;
                      quizController.circles = [];
                      quizController.currentQuestionIndecator.value = 1;
                      NetQuiz.quizquestions = [];
                      Get.back();
                    },
                    child: const MyText(
                      myText: 'yes',
                      mysize: 15,
                      mycolor: Colors.white,
                      family: MyFont.poppinsMedium,
                    ),
                  ),
                ),
                cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      side: const BorderSide(width: 1),
                    ),
                    child: const MyText(
                      myText: 'no',
                      mysize: 15,
                      family: MyFont.poppinsMedium,
                      mycolor: Colors.black,
                    )),
                middleText: '',
              );
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
          ? insub.value
              ? const EdgeInsets.only(right: 56)
              : EdgeInsets.zero
          : navController.buttomNavIcons[navController.index.value] == 'Quiz'
              ? showSolutions.value || inQuiz.value
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
