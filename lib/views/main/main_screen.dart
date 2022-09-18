import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/models/buttom_nav.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MainController>(
      builder: (mainController) {
        return Scaffold(
          //! / app bar
          appBar: AppBar(
            leading: mainController.whichLeading(),
            elevation: 0,
            title: mainController.whichTitle(),
          ),
          //!bottomNavigationBar
          bottomNavigationBar: ButtomNav(),
          //! body
          body: mainController.whichScreen(),
        );
      },
    );
  }
}
