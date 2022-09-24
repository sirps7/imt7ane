import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScore extends StatelessWidget {
  const QuizScore({super.key});
  static String lecture = '';
  static String subName = '';

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    QuizController quizController = Get.find();
    SubjectsControllers subjectsControllers = Get.find();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            //! score page text
            const MyText(
              myText: 'Score page',
              mysize: 30,
              family: 'Poppins',
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
                                  family: 'SFMarwa',
                                  height: 1,
                                ),
                                MyText(
                                  family: 'SFMarwa',
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
                          family: 'Poppins',
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
                                          '${quizController.correctAnswer.value}',
                                      mysize: 40,
                                      mycolor: Colors.black,
                                      family: 'PoppinsMedium',
                                    ),
                                  ),
                                  const MyText(
                                    myText: 'Correct',
                                    mysize: 15,
                                    family: 'PoppinsMedium',
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
                                          '${quizController.inCorrectAnswer.value}',
                                      mysize: 40,
                                      mycolor: Colors.black,
                                      family: 'PoppinsMedium',
                                    ),
                                  ),
                                  const MyText(
                                    myText: 'Incorrect',
                                    mysize: 15,
                                    family: 'PoppinsMedium',
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
                        child: const PurpleContainer(
                          H: 67,
                          W: 240,
                          child: Expanded(
                            child: MyText(
                              myText: 'Show The Correct Answers',
                              mysize: 20,
                              mycolor: Colors.white,
                              isbold: true,
                              height: 1.4,
                              family: 'PoppinsMedium',
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4),
                    child: const MyText(
                      myText: 'there is no quiz yet ',
                      mysize: 20,
                      mycolor: MyColor.mainColor,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
