import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utlites/dialogWarning.dart';

class QuizScore extends StatelessWidget {
  const QuizScore({super.key});
  static String lecture = '';
  static String subName = '';

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    QuizController quizController = Get.find();
    SubjectsControllers subjectsControllers = Get.find();

    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child :SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            //! score page text
             MyText(
              myText: 'score_page'.tr,
              mysize: 30,
              family: 'fonts'.tr,
            ),
            const SizedBox(
              height: 30,
            ),
            //! subject card
            !quizController.thereIsNoScore.value
                ? Column(
                    children: [
                      Container(
                        width: 250,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                  subjectsControllers.subImage[subName]!),
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText(
                                  myText: subName,
                                  mysize: 40,
                                  isbold: true,
                                  family: 'fonts'.tr,
                                  height: 1,
                                ),
                                MyText(
                                  family: 'fonts'.tr,
                                  myText: lecture,
                                  mysize: 20,
                                  mycolor: Colors.grey,
                                  height: 1.5,
                                ),
                              ],
                            )
                          ],
                        ),
                        //! subject card end
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //! your score
                      PurpleContainer(
                        H: 55,
                        W: 200,
                        child: MyText(
                          myText: 'Your Score ${quizController.lastQuizscore}',
                          mysize: 25,
                          family: 'fonts'.tr,
                          mycolor: Colors.white,
                        ),
                      ),
                      //! Correct and Incorrect
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 50, left: 50),
                        child: SizedBox(
                          width: 400,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: MyColor.yColor,
                                    radius: 35,
                                    child: MyText(
                                      myText:
                                          '${quizController.last_correctAnswer.value}',
                                      mysize: 40,
                                      mycolor: Colors.black,
                                      family: 'fonts'.tr,
                                    ),
                                  ),
                                   MyText(
                                    myText: 'correct'.tr,
                                    mysize: 15,
                                    family: 'fonts'.tr,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: MyColor.yColor,
                                    radius: 35,
                                    child: MyText(
                                      myText:
                                          '${quizController.last_incorrectAnswer.value}',
                                      mysize: 40,
                                      mycolor: Colors.black,
                                      family: 'fonts'.tr,
                                    ),
                                  ),
                                   MyText(
                                    myText: 'incorrect'.tr,
                                    mysize: 15,
                                    family: 'fonts'.tr,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      //! Show The Correct Answers container
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () => mainController.showSolutions.value = true,
                        child:  PurpleContainer(
                          H: 67,
                          W: 240,
                          child: Expanded(
                            child: MyText(
                              myText: 'show_the_correct_answer'.tr,
                              mysize: 20,
                              mycolor: Colors.white,
                              isbold: true,
                              height: 1.4,
                              family: 'fonts'.tr,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    child:  MyText(
                      myText: 'no_quiz'.tr,
                      mysize: 20,
                      mycolor: MyColor.mainColor,
                    ),
                  )
          ],
        ),
      ),
        ) );
  }
}
