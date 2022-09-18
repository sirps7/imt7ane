import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/solution_model.dart';
import 'package:flutter/material.dart';

class QuizSolutions extends StatelessWidget {
  const QuizSolutions({super.key});

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
                    myText: 'فيزياء',
                    mysize: 25,
                    family: MyFont.arabic,
                    height: 1.5,
                  ),
                  MyText(
                    myText: 'الفصل الاول',
                    mysize: 17,
                    family: MyFont.arabic,
                    height: 1,
                  ),
                ],
              ),
            ),
            MyText(
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
              itemCount: 4,
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
                    questionBody: 'what is your name ? ',
                    questionNo: index + 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
