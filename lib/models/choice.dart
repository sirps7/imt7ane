import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choice extends StatelessWidget {
  Choice({
    super.key,
    required this.choiceBody,
    this.inSolution = false,
    required this.questionNo,
  });
  final ChoiceController choiceController = Get.find();

  final String choiceBody;
  final bool inSolution;
  final int questionNo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!inSolution) {
          NetQuiz.quizquestions[questionNo - 1][questionNo]!.selectedChioce
              .value = choiceBody;
          choiceController.heSelectOneOfChoices = true;
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: NetQuiz.quizquestions[questionNo - 1][questionNo]!
                            .selectedChioce.value ==
                        choiceBody
                    ? Colors.blue
                    : Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 207, 211, 213),
                  width: 4,
                ),
              ),
            );
          }),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: MyText(
              myText: choiceBody,
              mysize: 20,
              family: MyFont.arabic,
              lines: 25,
              height: 1.2,
              align: TextAlign.start,
              mycolor: inSolution
                  ? inSolution &&
                          NetQuiz.quizquestions[questionNo - 1][questionNo]!
                              .choices
                              .firstWhere((e) => e.choiceBody == choiceBody)
                              .isCorrect
                      ? Colors.green
                      : Colors.red
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
