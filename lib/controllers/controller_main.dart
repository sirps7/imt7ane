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
import 'package:amti7ane_unicoding/models/networking/quiz_history.dart';
import 'package:amti7ane_unicoding/views/home/home_screen.dart';
import 'package:amti7ane_unicoding/views/home/subjects_lectures.dart';
import 'package:amti7ane_unicoding/views/profile/profile_screen.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:amti7ane_unicoding/views/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MainController extends GetxController {
  RxBool insub = false.obs;
  RxBool inQuiz = false.obs;
  RxBool showSolutions = false.obs;

  BottomNavigationController navController = Get.find();
  SubjectsControllers subjectsControllers = Get.find();
  QuizController quizController = Get.find();
  TimerController timerController = Get.find();
  DropdownButtonController dropdownButtonController = Get.find();
  Box saveScoreLocal = Hive.box<dynamic>('lastQuizScore');
  Box saveQuestionsLocal = Hive.box<dynamic>('lastQuestions');

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
          navController.buttomNavIcons[navController.index.value] ==
              'home'.tr) {
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
          navController.buttomNavIcons[navController.index.value] ==
              'quiz'.tr) {
        return IconButton(
          onPressed: () {
            if (inQuiz.value) {
              Get.defaultDialog(
                backgroundColor: MyColor.mainColor,
                barrierDismissible: false,
                radius: 10,
                titlePadding:
                    const EdgeInsets.only(top: 10, bottom: 0, right: 15),
                title: 'exit exam'.tr,
                titleStyle: const TextStyle(
                    color: Colors.white, fontFamily: MyFont.poppins),
                confirm: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      quizController.dialogTC.value = 'exit'.tr;
                      inQuiz.value = false;
                      navController.index.value = 0;
                      quizController.sendQuiz();
                      quizController.resetQuestion();
                      quizController.saveLastQuizScore();
                      timerController.stopTimer();
                      timerController.firstTime = true;
                      quizController.circleNumber.value = 0;
                      quizController.circles = [];
                      quizController.currentQuestionIndecator.value = 1;
                      NetQuiz.quizquestions = [];

                      quizController.saveLastQuizScore();
                      quizController.last_incorrectAnswer.value =
                          quizController.inCorrectAnswer.value;
                      quizController.last_correctAnswer.value =
                          quizController.correctAnswer.value;
                      saveScoreLocal.put(
                        'last_incorrectAnswer',
                        quizController.last_incorrectAnswer.value,
                      );
                      saveScoreLocal.put(
                        'last_correctAnswer',
                        quizController.last_correctAnswer.value,
                      );
                      saveScoreLocal.put(
                        'last_score',
                        quizController.lastQuizscore,
                      );
                      saveScoreLocal.put('last_lecture', QuizQuestons.lecture);
                      saveScoreLocal.put('last_subName', QuizQuestons.subName);
                      saveQuestionsLocal.put(
                        'last_questions',
                        NetQuiz.quizquestions,
                      );
                      quizController.sendQuiz();
                      QuizSolutions.lectureName = QuizQuestons.lecture;
                      QuizSolutions.subjectName = QuizQuestons.subName;
                      QuizScore.lecture = QuizQuestons.lecture;
                      QuizScore.subName = QuizQuestons.subName;
                      History.historyList = [];
                      quizController.getQuizesHistoryWithAvgAndTotal();
                      quizController.correctAnswer.value = 0;
                      quizController.inCorrectAnswer.value = 0;

                      Get.back();
                    },
                    child: MyText(
                      myText: 'yes'.tr,
                      mysize: 20,
                      mycolor: Colors.white,
                      family: MyFont.poppinsMedium,
                    ),
                  ),
                ),
                cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: MyText(
                      myText: 'no'.tr,
                      mysize: 20,
                      family: MyFont.poppinsMedium,
                      mycolor: Colors.white,
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
      padding: navController.buttomNavIcons[navController.index.value] ==
              'home'.tr
          ? insub.value
              ? const EdgeInsets.only(right: 56)
              : EdgeInsets.zero
          : navController.buttomNavIcons[navController.index.value] == 'quiz'.tr
              ? showSolutions.value || inQuiz.value
                  ? const EdgeInsets.only(right: 56)
                  : EdgeInsets.zero
              : EdgeInsets.zero,
      child: Center(
        child: MyText(
          myText: navController.buttomNavIcons[navController.index.value],
          mysize: 35,
          family: 'fonts'.tr,
        ),
      ),
    );
  }
}
