import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtomNav extends StatelessWidget {
  ButtomNav({
    Key? key,
  }) : super(key: key);
  final BottomNavigationController mycontroller = Get.find();

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
          mycontroller.index.value = v;
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(
              image:
                  const AssetImage('assets/images/buttom_icons/home_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'home'.tr
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                  'home'.tr
                  ? mycontroller.max
                  : mycontroller.min,
            ),
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
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'quiz'.tr
                  ? mycontroller.max
                  : mycontroller.min,
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
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'profile'.tr
                  ? mycontroller.max
                  : mycontroller.min,
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
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'settings'.tr
                  ? mycontroller.max
                  : mycontroller.min,
            ),
            label: 'settings'.tr,
          ),
        ],
      );
    });
  }
}
