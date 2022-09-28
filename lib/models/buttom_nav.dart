import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/timerController.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/views/utlites/dialogWarning.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller_main.dart';
import 'networking/deffult_quizes.dart';

class ButtomNav extends StatelessWidget {
  ButtomNav({
    Key? key,
  }) : super(key: key);
  final BottomNavigationController mycontroller = Get.find();
  final MainController mainController = Get.find();
  final TimerController timerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavigationController>(builder: (mycontroller) {
      return BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'fonts'.tr),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: mycontroller.index.value,
        selectedItemColor: MyColor.mainColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int v) {
          if (mainController.inQuiz.value && v != 1) {
            Get.defaultDialog(
              backgroundColor: MyColor.mainColor,
              barrierDismissible: false,
              radius: 10,
              titlePadding:
                  const EdgeInsets.only(top: 10, bottom: 0, right: 15),
              title: 'exit exam'.tr,
              titleStyle: const TextStyle(
                  color: Colors.white, fontFamily: MyFont.poppins),
              confirm: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    quizController.dialogTC.value = 'exit'.tr;
                    mainController.inQuiz.value = false;
                    mycontroller.index.value = 0;
                    quizController.resetQuestion();
                    timerController.stopTimer();
                    timerController.firstTime = true;
                    quizController.circleNumber.value = 0;
                    quizController.circles = [];
                    quizController.currentQuestionIndecator.value = 1;
                    NetQuiz.quizquestions = [];
                    Get.back();
                  },
                  child: MyText(
                    myText: 'yes'.tr,
                    mysize: 20,
                    mycolor: Colors.white,
                    family: MyFont.poppinsMedium,
                  ),
                ),
              ),
              cancel: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: MyText(
                    myText: 'no'.tr,
                    mysize: 20,
                    family: MyFont.poppinsMedium,
                    mycolor: Colors.white,
                  )),
              middleText: '',
            );
          } else {
            mycontroller.index.value = v;
            mainController.insub.value = false;
            Quizes.quizesList = [];
          }
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
                image: const AssetImage(
                    'assets/images/buttom_icons/home_icon.png'),
                color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                        'home'.tr
                    ? MyColor.mainColor
                    : Colors.grey,
                fit: BoxFit.cover,
                height: mycontroller.max),
            label: 'home'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image(
              image:
                  const AssetImage('assets/images/buttom_icons/quiz_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'quiz'.tr
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.max,
            ),
            label: 'quiz'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(
                  'assets/images/buttom_icons/profile_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'profile'.tr
                  ? MyColor.mainColor
                  : Colors.grey,
              height: mycontroller.max,
              fit: BoxFit.cover,
            ),
            label: 'profile'.tr,
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(
                  'assets/images/buttom_icons/sittings_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'settings'.tr
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.max,
            ),
            label: 'settings'.tr,
          ),
        ],
      );
    });
  }
}
