import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/choice.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/quiz_history.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/models/question.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_score_page.dart';
import 'package:amti7ane_unicoding/views/quiz/quiz_solutions.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../utlites/dialogWarning.dart';

class QuizQuestons extends StatelessWidget {
  QuizQuestons({super.key});
  static String lecture = '';
  static String subName = '';

  final QuizController quizController = Get.find();
  final ChoiceController choiceController = Get.find();
  final TimerController timerController = Get.find();
  final BottomNavigationController navController = Get.find();
  static String? subjectName;

  @override
  Widget build(BuildContext context) {
    Box saveScoreLocal = Hive.box<dynamic>('lastQuizScore');
    Box saveQuestionsLocal = Hive.box<dynamic>('lastQuestions');
    final player = AudioCache();
    MainController mainController = Get.find();
    ScrollController scrollController = ScrollController();
    timerController.startTimer();
    RxInt counter = 0.obs;
    return WillPopScope(
        onWillPop: () async {
          quizController.dialogTC.value = 'exit exam'.tr;
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Container(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          width: double.infinity,
          child: Column(
            children: [
              //! first row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //!timer
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        myText: 'timer'.tr,
                        mysize: 20,
                        family: 'fonts'.tr,
                      ),
                      GetX<TimerController>(builder: (timerController) {
                        return MyText(
                          myText:
                              '${timerController.hours}:${timerController.minutes}:${timerController.seconds}',
                          mysize: 18,
                          family: MyFont.poppinsMedium,
                          mycolor: timerController.lessMin.value
                              ? Colors.redAccent
                              : Colors.black,
                        );
                      })
                    ],
                  ), //!score
                  //! questions
                  Column(
                    children: [
                      MyText(
                        myText: subjectName!,
                        mysize: 23,
                        family: MyFont.arabic,
                        isbold: true,
                      ),
                      MyText(
                        myText: 'question'.tr,
                        mysize: 27,
                        // family: MyFont.poppins,
                        family: 'fonts'.tr,
                        height: 1.5,
                      )
                    ],
                  ),
                  //! score
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: MyText(
                          myText: 'score'.tr,
                          mysize: 20,
                          // family: MyFont.poppinsMedium,
                          family: 'fontsmedium'.tr,
                        ),
                      ),
                      GetX<QuizController>(builder: (quizController) {
                        return Container(
                          height: 60,
                          child: Stack(
                            children: [
                              MyText(
                                myText: '${quizController.score.value}',
                                mysize: 18,
                                family: MyFont.poppinsMedium,
                              ),
                              Visibility(
                                  visible:
                                      quizController.Correctvisiblity.value,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          top: quizController
                                              .fadedCorrectPoints.value),
                                      child: MyText(
                                        myText: '+5',
                                        mysize: 18,
                                        family: MyFont.poppinsMedium,
                                        mycolor: Colors.black.withOpacity(
                                            quizController
                                                .fadedCorrectColorOpt.value),
                                      )))
                            ],
                          ),
                        );
                      })
                    ],
                  )
                ],
              ),
              //! secound row
              const SizedBox(
                height: 10,
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: scrollController,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: quizController.circles.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return quizController.circles[index];
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //!question
                      GetX<QuizController>(
                        builder: (quizController) => Question(
                            questionBody: NetQuiz
                                .quizquestions[quizController
                                            .currentQuestionIndecator.value -
                                        1][
                                    quizController
                                        .currentQuestionIndecator.value]!
                                .questionBody,
                            questionNo: NetQuiz
                                .quizquestions[quizController
                                        .currentQuestionIndecator.value -
                                    1][quizController.currentQuestionIndecator.value]!
                                .questionNo),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //! choices
                      GetX<QuizController>(builder: (quizController) {
                        return ShakeWidget(
                          shakeConstant: ShakeDefaultConstant1(),
                          autoPlay: quizController.playShake.value,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: quizController.con_color.value,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: MyColor.milk,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: quizController.con_color.value,
                                  width: 5,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    myText: 'choose_any_of_the_following'.tr,
                                    mysize: 20,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  //! choices column

                                  ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: NetQuiz
                                        .quizquestions[quizController
                                                    .currentQuestionIndecator
                                                    .value -
                                                1][
                                            quizController
                                                .currentQuestionIndecator
                                                .value]!
                                        .choices
                                        .length,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Container(
                                          color: const Color.fromARGB(
                                              255, 148, 155, 183),
                                          height: 1,
                                        ),
                                      );
                                    },
                                    itemBuilder: (BuildContext context, index) {
                                      return Choice(
                                        questionNo: NetQuiz
                                            .quizquestions[quizController
                                                        .currentQuestionIndecator
                                                        .value -
                                                    1][
                                                quizController
                                                    .currentQuestionIndecator
                                                    .value]!
                                            .questionNo,
                                        choiceBody: NetQuiz
                                            .quizquestions[quizController
                                                        .currentQuestionIndecator
                                                        .value -
                                                    1][
                                                quizController
                                                    .currentQuestionIndecator
                                                    .value]!
                                            .choices[index]
                                            .choiceBody,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),

                      const SizedBox(
                        height: 20,
                      ),
                      //! next button
                      GestureDetector(
                        onTap: () async {
                          if (choiceController.heSelectOneOfChoices) {
                            if ((
                                    //!--------------------------------------------
                                    NetQuiz
                                        .quizquestions[quizController
                                                    .currentQuestionIndecator
                                                    .value -
                                                1][
                                            quizController.currentQuestionIndecator
                                                .value]!
                                        .choices
                                        .firstWhere((e) =>
                                            e.choiceBody ==
                                            NetQuiz
                                                .quizquestions[quizController
                                                        .currentQuestionIndecator
                                                        .value -
                                                    1][quizController.currentQuestionIndecator.value]!
                                                .selectedChioce
                                                .value)).isCorrect
                                //!--------------------------------------------
                                ) {
                              player.play('sounds/Correct.mp3');
                              quizController.con_color.value =
                                  Colors.greenAccent;
                              int i = 0;
                              quizController.Correctvisiblity.value = true;
                              while (i < 500) {
                                await Future.delayed(
                                    const Duration(milliseconds: 25));
                                quizController.fadedCorrectPoints.value -= 2;
                                quizController.fadedCorrectColorOpt.value -=
                                    0.05;
                                i += 25;
                              }
                              quizController.fadedCorrectColorOpt.value = 1.0;
                              quizController.Correctvisiblity.value = false;
                              quizController.fadedCorrectPoints.value = 40;
                              quizController.con_color.value =
                                  Colors.grey.shade300;
                              quizController.score += 5;
                              quizController.correctAnswer.value++;
                            } else {
                              player.play('sounds/Error.mp3', volume: 1.5);
                              quizController.con_color.value = Colors.redAccent;

                              quizController.playShake.value = true;
                              await Future.delayed(
                                  const Duration(milliseconds: 500));
                              quizController.con_color.value =
                                  Colors.grey.shade300;
                              quizController.playShake.value = false;
                              quizController.inCorrectAnswer.value++;
                            }
                            counter.value++;
                            if (quizController.circleNumber.value <
                                quizController.circles.length - 1) {
                              quizController.currentQuestionIndecator.value++;
                              quizController.nextQuestion();
                              quizController.circleNumber.value++;
                            }

                            if (quizController.circleNumber.value <
                                    quizController.circles.length - 3 &&
                                quizController.circleNumber.value > 3) {
                              if (quizController.circleNumber.value == 4) {
                                scrollController.jumpTo(
                                    scrollController.offset + 53.71484375);
                              } else {
                                scrollController
                                    .jumpTo(scrollController.offset + 56);
                              }
                            }
                            choiceController.heSelectOneOfChoices = false;
                          }
                          //! submit
                          if (counter.value == quizController.noOfQuestions) {
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
                            saveScoreLocal.put('last_lecture', lecture);
                            saveScoreLocal.put('last_subName', subName);
                            saveQuestionsLocal.put(
                              'last_questions',
                              NetQuiz.quizquestions,
                            );
                            quizController.sendQuiz();
                            mainController.showSolutions.value = false;
                            mainController.inQuiz.value = false;
                            navController.index.value = 1;
                            quizController.resetQuestion();
                            timerController.stopTimer();
                            timerController.firstTime = true;
                            quizController.circleNumber.value = 0;
                            quizController.circles = [];
                            quizController.currentQuestionIndecator.value = 1;

                            QuizSolutions.lectureName = lecture;
                            QuizSolutions.subjectName = subName;
                            QuizScore.lecture = lecture;
                            QuizScore.subName = subName;
                            StudentHistory.historyList = [];
                            quizController.getQuizesHistoryWithAvgAndTotal();
                            quizController.correctAnswer.value = 0;
                            quizController.inCorrectAnswer.value = 0;
                            quizController.saveLastQuizScore();
                          }
                        },
                        child: PurpleContainer(
                          H: 40,
                          W: 140,
                          child:
                              GetX<QuizController>(builder: (quizController) {
                            return MyText(
                              myText: counter.value ==
                                      quizController.noOfQuestions - 1
                                  ? 'send'.tr
                                  : 'next'.tr,
                              mysize: 20,
                              mycolor: Colors.white,
                              family: MyFont.poppinsMedium,
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
