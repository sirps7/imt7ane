import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/models/card.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/loading.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_subjects.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DropdownButtonController dropController = Get.find();
  final SubjectsControllers subController = Get.find();
  final QuizController quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          //! drop down list
          Padding(
            padding: const EdgeInsets.only(bottom: 38, top: 30, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: MyColor.mainColor,
                  ),
                  height: 35,
                  width: 165,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: GetX<DropdownButtonController>(
                        builder: (dropController) {
                      return DropdownButton<String>(
                        menuMaxHeight: 300,
                        icon: const Expanded(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        dropdownColor: MyColor.mainColor,
                        value: dropController.selectedItem.value,
                        borderRadius: BorderRadius.circular(10),
                        items: dropController.stageList
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: MyText(
                                  family: 'SFMarwa',
                                  myText: item,
                                  mysize: 20,
                                  mycolor: Colors.white,
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          quizController.deffult = false;
                          dropController.selectedItem.value = value!;
                          subController.getSubjectsWithStageId();
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          //!cards
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Center(
                    child: SizedBox(
                      width: 700,
                      child: GetX<SubjectsControllers>(
                          builder: (subjectsControllers) {
                        return subjectsControllers.getSubjectsWithIdDone.value
                            ? Wrap(
                                alignment: WrapAlignment.end,
                                spacing: 37,
                                runSpacing: 37,
                                children: Subjects.deffultsubjects
                                    .map(
                                      (e) => MyCard(
                                        subject: e.name,
                                        subNo: e.id,
                                        firstText: e.name,
                                        secondText: e.quizCount.toString(),
                                        subjectIcon: AssetImage(
                                          subController.subImage
                                                  .containsKey(e.name)
                                              ? subController.subImage[e.name]!
                                              : 'assets/images/subjects_icons/jokerIcon.png',
                                        ),
                                      ),
                                    )
                                    .toList())
                            : Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 4),
                                child: const MyLoading(),
                              );
                      }),
                    ),
                    // assets/images/subjects_icons/jokerIcon.png
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
