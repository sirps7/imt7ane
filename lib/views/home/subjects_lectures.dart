import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/lecture.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_quizes.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class SubjectLectures extends StatelessWidget {
  const SubjectLectures({super.key});

  static AssetImage? subIcon;
  static String? subName;
  static int time = Quizes.finalQuiz.time;
  static int questionNo = Quizes.finalQuiz.questionNo;

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    BottomNavigationController navController = Get.find();
    QuizController quizController = Get.find();
    TimerController timerController = Get.find();
     BottomNavigationController mycontroller = Get.find();
    quizController.firstTime = true;
    return WillPopScope(
        onWillPop: () {
          mycontroller.index.value = 0;
          mainController.insub.value=false;
          Quizes.quizesList = [];
      return Future.value(false);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //!static elements
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 43, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/img_2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (quizController.firstTime) {
                      quizController.quizId = Quizes.finalQuiz.id;
                      QuizQuestons.lecture = Quizes.finalQuiz.name;
                      QuizQuestons.subName = subName!;
                      navController.index.value = 1;
                      mainController.inQuiz.value = true;
                      quizController.quizId = Quizes.finalQuiz.id;
                      await quizController.getQuiz();
                      TimerController.givenMinutes = Quizes.finalQuiz.time;
                      timerController.refreshTimer();
                      quizController.noOfQuestions =
                          NetQuiz.quizquestions.length;
                      quizController.addCircles();
                      QuizQuestons.subjectName = subName;
                      quizController.firstTime = false;
                    }
                  },
                  child: Container(
                    width: 250,
                    height: 105,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.elliptical(20, 10),
                          right: Radius.elliptical(20, 10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: subIcon!,
                                  height: 50,
                                  width: 50,
                                ),
                                Expanded(
                                  child: MyText(
                                    myText: subName!.length > 15
                                        ? subName!
                                            .substring(0, subName!.length - 11)
                                        : subName!,
                                    mysize: 20,
                                    family: MyFont.arabic,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const MyText(
                                  myText: 'الامتحان الشامل',
                                  mysize: 15,
                                  family: 'SFMarwa',
                                ),
                                MyText(
                                  myText: ' الوقت :' '$time' ' دقيقة  ',
                                  mysize: 15,
                                  family: MyFont.arabic,
                                ),
                                MyText(
                                  myText: ' $questionNo :عدد الاسئلة',
                                  mysize: 15,
                                  family: MyFont.arabic,
                                  defflutDirection: false,
                                  direction: TextDirection.ltr,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const MyText(
              myText: 'الفصول',
              mysize: 50,
              family: MyFont.arabic,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: Quizes.quizesList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 25,
                );
              },
              itemBuilder: (context, index) {
                return Lecture(
                  quizId: Quizes.quizesList[index].id,
                  lecture: Quizes.quizesList[index].name,
                  lectureTitle: Quizes.quizesList[index].chapterName!,
                  questionNo: Quizes.quizesList[index].questionNo,
                  time: Quizes.quizesList[index].time,
                  subName: subName!,
                );
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
