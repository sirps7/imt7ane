import 'package:amti7ane_unicoding/controllers/choiceController.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Choice extends StatelessWidget {
  Choice({super.key, required this.choiceBody, this.inSolution = false});
  final ChoiceController choiceController = Get.find();

  final String choiceBody;
  final bool inSolution;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!inSolution) {
          choiceController.selectedChoice.value = choiceBody;
        }
      },
      child: Row(
        children: [
          GetX<ChoiceController>(builder: (choiceController) {
            return Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: !(choiceController.selectedChoice.value == choiceBody)
                    ? Colors.white
                    : Colors.blue,
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
          MyText(
            myText: choiceBody,
            mysize: 20,
            family: MyFont.arabic,
            mycolor: inSolution
                ? inSolution &&
                        choiceController.selectedChoice.value == choiceBody
                    ? Colors.green
                    : Colors.red
                : Colors.black,
          ),
        ],
      ),
    );
  }
}
