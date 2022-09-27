import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.ontap,
    required this.title,
    required this.wichicon,
    required this.condtion,
    this.child = const SizedBox(),
  }) : super(key: key);

  final Function() ontap;
  final String title;
  final RxBool wichicon;
  final RxBool condtion;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            alignment: Alignment.center,
            width: 350,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MyColor.secounderyColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  myText: title,
                  mysize: 20,
                  mycolor: Colors.white,
                ),

                GetX<SettingController>(builder: (context) {
                  return Icon(
                    wichicon.value
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    size: 35,
                    color: Colors.white,
                  );
                })
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GetX<SettingController>(builder: (controller) {
          if (condtion.value) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: child,
            );
          } else {
            return const SizedBox(
              height: 15,
            );
          }
        })
      ],
    );
  }
}
