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
                      'Home'
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'Home'
                  ? mycontroller.max
                  : mycontroller.min,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image:
                  const AssetImage('assets/images/buttom_icons/quiz_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'Quiz'
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'Quiz'
                  ? mycontroller.max
                  : mycontroller.min,
            ),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(
                  'assets/images/buttom_icons/profile_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'profile'
                  ? MyColor.mainColor
                  : Colors.grey,
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'profile'
                  ? mycontroller.max
                  : mycontroller.min,
              fit: BoxFit.cover,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image(
              image: const AssetImage(
                  'assets/images/buttom_icons/sittings_icon.png'),
              color: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'settings'
                  ? MyColor.mainColor
                  : Colors.grey,
              fit: BoxFit.cover,
              height: mycontroller.buttomNavIcons[mycontroller.index.value] ==
                      'settings'
                  ? mycontroller.max
                  : mycontroller.min,
            ),
            label: 'Settings',
          ),
        ],
      );
    });
  }
}
