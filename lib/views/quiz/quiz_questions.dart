import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/choice.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizQuestons extends StatelessWidget {
  QuizQuestons({super.key});

  final QuizController quizController = Get.find();
  final ChoiceController choiceController = Get.find();
  final TimerController timerController = Get.find();

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    timerController.startTimer();

    return Container(
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
                  const MyText(
                    myText: 'TIMER',
                    mysize: 20,
                    family: MyFont.poppinsMedium,
                  ),
                  GetX<TimerController>(builder: (timerController) {
                    return MyText(
                      myText:
                          '${timerController.hours}:${timerController.minutes}:${timerController.seconds}',
                      mysize: 18,
                      family: MyFont.poppinsMedium,
                    );
                  })
                ],
              ), //!score
              //! questions
              Column(
                children: const [
                  MyText(
                    myText: 'فيزياء',
                    mysize: 23,
                    family: MyFont.arabic,
                    isbold: true,
                  ),
                  MyText(
                    myText: 'Questions',
                    mysize: 27,
                    family: MyFont.poppins,
                    height: 1.5,
                  )
                ],
              ),
              //! score
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MyText(
                    myText: 'Score',
                    mysize: 20,
                    family: MyFont.poppinsMedium,
                  ),
                  MyText(
                    myText: '3',
                    mysize: 18,
                    family: MyFont.poppinsMedium,
                  )
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
                    child: Row(
                      children: [
                        Expanded(
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
                  const SizedBox(
                    height: 30,
                  ),
                  //!question

                  const Question(
                      questionBody:
                          'من هو العالم الذي قام باكتشاف الجاذب الجاذبيه الارضيه ؟',
                      questionNo: 1),

                  const SizedBox(
                    height: 30,
                  ),
                  //! choices
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
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
                          color: Colors.grey.shade300,
                          width: 5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText(
                            myText: 'Choose any of the following:',
                            mysize: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //! choices row
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: choiceController.choices.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Choice(
                                choiceBody: choiceController.choices[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //! next button
                  GestureDetector(
                    onTap: () {
                      quizController.nextQuestion();
                      quizController.circleNumber.value++;
                      if (quizController.circleNumber.value <
                              quizController.circles.length - 3 &&
                          quizController.circleNumber.value > 3) {
                        if (quizController.circleNumber.value == 4) {
                          scrollController
                              .jumpTo(scrollController.offset + 53.71484375);
                        } else {
                          scrollController.jumpTo(scrollController.offset + 56);
                        }
                      }
                    },
                    child: PurpleContainer(
                      H: 40,
                      W: 140,
                      child: GetX<QuizController>(builder: (quizController) {
                        return MyText(
                          myText: quizController.index.value ==
                                  quizController.noOfQuestions - 1
                              ? 'Submit'
                              : 'Next',
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
    );
  }
}
