import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lecture extends StatelessWidget {
  const Lecture({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    BottomNavigationController navController = Get.find();
    return GestureDetector(
      onTap: () {
        navController.index.value = 1;
        mainController.inQuiz.value = true;
      },
      child: SizedBox(
        height: 75,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: MyText(
                    myText: 'متسعات',
                    mysize: 17,
                    family: 'SFMarwa',
                  ),
                ),
                Expanded(
                  child: MyText(
                    myText: '12 Questions',
                    mysize: 15,
                  ),
                ),
                Expanded(
                  child: MyText(
                    myText: '12 Mins',
                    mysize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            const PurpleContainer(
              withShadow: false,
              H: 75,
              W: 150,
              child: MyText(
                myText: ' الفصل الاول',
                mysize: 23,
                mycolor: Colors.white,
                family: 'SFMarwa',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
