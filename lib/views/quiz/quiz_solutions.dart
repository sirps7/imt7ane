import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/solution_model.dart';
import 'package:flutter/material.dart';

class QuizSolutions extends StatelessWidget {
  const QuizSolutions({super.key});
  static String subjectName = '';
  static String lectureName = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  MyText(
                    myText: subjectName,
                    mysize: 25,
                    family: MyFont.arabic,
                    height: 1.5,
                  ),
                  MyText(
                    myText: lectureName,
                    mysize: 17,
                    family: MyFont.arabic,
                    height: 1,
                  ),
                ],
              ),
            ),
            const MyText(
              myText: 'Solutions',
              mysize: 30,
              family: MyFont.poppinsMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: NetQuiz.quizquestions.length,
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    height: 3,
                    color: const Color.fromARGB(255, 129, 133, 241),
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return QuizSolution(
                  questionBody:
                      NetQuiz.quizquestions[index][index + 1]!.questionBody,
                  questionNo: index + 1,
                  choices: NetQuiz.quizquestions[index][index + 1]!.choices,
                  isProblem: NetQuiz.quizquestions[index][index + 1]!.isProblem,
                  problemImage: NetQuiz.quizquestions[index][index + 1]!.image,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
