import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controllers/quiz_controller.dart';
import '../../models/Colors.dart';
import 'package:get/get.dart';
final QuizController quizController = Get.find();

Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
  context: context,
  builder: (context) => BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    child: AlertDialog(
      backgroundColor: MyColor.mainColor,
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),

      title:  Obx(() {
          return Text(
            quizController.dialogTC.value,
            style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
          );
        }
      ),
      actions: [
        TextButton(
          child:  Text(
            'no'.tr,
            style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        TextButton(
          onPressed: () {
            quizController.dialogTC.value='exit'.tr;
            SystemNavigator. pop();
          },
          child:  Text(
            'yes'.tr,
            style: TextStyle(color: Colors.white,fontFamily: 'fonts'.tr),
          ),
        ),
      ],
    ),
  ),
);