import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/choice.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizSolution extends StatelessWidget {
  const QuizSolution({
    super.key,
    required this.questionNo,
    required this.questionBody,
    required this.choices,
    required this.isProblem,
    required this.problemImage,
  });
  final int questionNo;
  final String questionBody;
  final List choices;
  final bool isProblem;
  final String? problemImage;

  @override
  Widget build(BuildContext context) {
    // ChoiceController choiceController = Get.find();
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Question(
            questionNo: questionNo,
            questionBody: questionBody,
            isSolution: true,
          ),
          const SizedBox(
            height: 20,
          ),
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
                    itemCount: choices.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Choice(
                            questionNo: choices[index].questionNo,
                            choiceBody: choices[index].choiceBody,
                            inSolution: true,
                          ),
                          index == choices.length - 1
                              ? isProblem
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Image(
                                          image: NetworkImage(
                                              Server.baseUrl + problemImage!)),
                                    )
                                  : const Align()
                              : const Align()
                        ],
                      );
                    },
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
