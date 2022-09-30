import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/quiz_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz_history.dart';
import 'package:amti7ane_unicoding/models/quiz_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utlites/dialogWarning.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! main image
          Container(
            alignment: Alignment.center,
            height: 230,
            color: MyColor.profileBackColor,
            width: double.infinity,
            child: GetX<BottomNavigationController>(
                builder: (buttomNavController) {
              return Image(
                image: AssetImage(
                  buttomNavController.genderSelectedItem.value == 'Male'
                      ? 'assets/images/profile_image.png'
                      : 'assets/images/girl_image.png',
                ),
                fit: BoxFit.cover,
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //!first outlin border
                    Container(
                      height: 110,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColor.borderColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           MyText(
                            myText: 'avg_score'.tr,
                            mysize: 17,
                            // family: 'Poppinsbold',
                             family: 'fontsbold'.tr,
                          ),
                          GetX<QuizController>(builder: (quizController) {
                            return MyText(
                              myText: '${quizController.avg.value}%',
                              mysize: 40,
                              family: 'Poppinsbold',
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    //!secound outlin border
                    Container(
                      height: 110,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColor.borderColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           MyText(
                            myText: 'total_quizzes'.tr,
                            mysize: 17,
                            // family: 'Poppinsbold',
                             family: 'fontsbold'.tr,
                          ),
                          GetX<QuizController>(builder: (quizController) {
                            return MyText(
                              myText: '${quizController.total.value}',
                              mysize: 40,
                              family: 'Poppinsbold',
                              overFlow: TextOverflow.clip,
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //!Quiz History
                 MyText(
                  myText: 'quiz_history'.tr,
                  mysize: 35,
                ),
                const SizedBox(
                  height: 20,
                ),

                //!history
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: StudentHistory.historyList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return StudentHistory.historyList[index];
                  },
                ),
              ],
            ),
          )
        ],
      ),
      ));
  }

