import 'package:amti7ane_unicoding/Services/Sign_up_remote.dart';
import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:amti7ane_unicoding/controllers/subjects_controllers.dart';
import 'package:amti7ane_unicoding/locale/locale_Controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/loading.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/networking/profileInfo.dart';
import 'package:amti7ane_unicoding/models/networking/quiz.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/models/settings_button.dart';
import 'package:amti7ane_unicoding/views/auth/mainScreen/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amti7ane_unicoding/controllers/sign_out_controller.dart';
import 'package:hive/hive.dart';
import '../../models/networking/deffult_subjects.dart';
import '../../models/networking/quiz_history.dart';
import '../utlites/dialogWarning.dart';
import 'package:amti7ane_unicoding/models/quiz_history.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final SettingController settingController = Get.find();
  final BottomNavigationController bottomNavigationController = Get.find();
  final SubjectsControllers subjectsControllers = Get.find();
  final DropdownButtonController dropController = Get.find();
  final TextEditingController mycontroller = TextEditingController();
  final from = Get.find<MyControllerAuth>();
  final MyLocaleController controllerLang = Get.find();
  static DropdownButtonController dropdownButtonController = Get.find();

  MyLocaleController c = Get.find();

  @override
  Widget build(BuildContext context) {
    if (settingController.takeTheNameFromDb) {
      mycontroller.text = ProfileInfo.studentName!;
      settingController.takeTheNameFromDb = false;
    }
    Box auth = Hive.box<dynamic>('auth');
    Box question = Hive.box<dynamic>('lastQuestions');
    Box score = Hive.box<dynamic>('lastQuizScore');

    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: SizedBox(
          width: double.infinity,

          //todo the first column
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //!main imagae
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
                const SizedBox(
                  height: 20.0,
                ),

                //! settings first button
                SettingsButton(
                  condtion: settingController.profilebutton,
                  wichicon: settingController.profilebutton,
                  title: 'profile_settings'.tr,
                  ontap: () {
                    settingController.toogleprofile();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        myText: 'name'.tr,
                        mysize: 15,
                        mycolor: Colors.grey,
                        // family: 'PoppinsMedium',
                        family: 'fonts'.tr,
                      ),
                      TextFormField(
                        controller: mycontroller,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontFamily: 'fonts'.tr, fontSize: 25),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyText(
                        myText: 'stage'.tr,
                        mysize: 15,
                        mycolor: Colors.grey,
                        // family: 'PoppinsMedium',
                        family: 'fontsmedium'.tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //! stage drop down
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          height: 35,
                          width: 165,
                          padding: const EdgeInsets.only(
                            left: 15,
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
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                dropdownColor: Colors.white,
                                value: dropController.settingSelectedItem.value,
                                borderRadius: BorderRadius.circular(10),
                                items: dropController.stageList
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: MyText(
                                          family: 'fonts'.tr,
                                          myText: item,
                                          mysize: 20,
                                          mycolor: Colors.black,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  dropController.settingSelectedItem.value =
                                      value!;
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //! gender drop down
                      MyText(
                        myText: 'gender'.tr,
                        mysize: 15,
                        mycolor: Colors.grey,
                        // family: 'PoppinsMedium',
                        family: 'fontsmedium'.tr,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                          ),
                          padding: const EdgeInsets.only(
                            left: 30,
                          ),
                          height: 35,
                          width: 165,
                          child: GetX<BottomNavigationController>(
                              builder: (bottomNavController) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Expanded(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                value: bottomNavController
                                    .genderSelectedItem.value,
                                items:
                                    bottomNavController.buttomNavSettingsGender
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: MyText(
                                                family: 'Poppins',
                                                myText: item,
                                                mysize: 18,
                                                mycolor: Colors.black,
                                              ),
                                            ))
                                        .toList(),
                                onChanged: (value) {
                                  bottomNavController.genderSelectedItem.value =
                                      value!;
                                },
                              ),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            settingController.sendSettingChange(
                              mycontroller.text,
                              bottomNavigationController
                                  .genderSelectedItem.value,
                              (Stages.stagesMap.firstWhere((e) => e.containsKey(
                                      dropController
                                          .settingSelectedItem.value)))[
                                  dropController.settingSelectedItem.value]!,
                              dropController.settingSelectedItem.value,
                            );
                            dropController.selectedItem.value =
                                dropController.settingSelectedItem.value;
                            subjectsControllers.getSubjectsWithStageId();
                          },
                          child: GetX<SettingController>(
                              builder: (settingController) {
                            return PurpleContainer(
                              color: const Color.fromARGB(255, 129, 133, 241),
                              H: 50,
                              W: 120,
                              child: settingController.updateProfileDone.value
                                  ? MyText(
                                      myText: 'save'.tr,
                                      mysize: 20,
                                      mycolor: Colors.white,
                                      // family: MyFont.poppinsMedium,
                                      family: 'fontsmedium'.tr,
                                    )
                                  : const MyLoading(mycolor: Colors.white),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //! settings secound button
                SettingsButton(
                    ontap: () {
                      settingController.tooglelanguageButton();
                    },
                    title: 'language'.tr,
                    wichicon: settingController.languagebutton,
                    condtion: settingController.languagebutton,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: GetX<SettingController>(builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (controller.language.value != 'en') {
                                  controller.tooglelanguage();
                                  controllerLang.changelang('en');
                                }
                              },
                              child: PurpleContainer(
                                H: 35,
                                W: 65,
                                withShadow: false,
                                child: MyText(
                                  myText: 'EN',
                                  mysize: 20,
                                  mycolor: controller.language.value == 'ar'
                                      ? Colors.white
                                      : Colors.yellow,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.language.value != 'ar') {
                                  controller.tooglelanguage();
                                  controllerLang.changelang('ar');
                                }
                              },
                              child: PurpleContainer(
                                H: 35,
                                W: 65,
                                withShadow: false,
                                child: MyText(
                                  myText: 'AR',
                                  mysize: 20,
                                  mycolor: controller.language.value == 'en'
                                      ? Colors.white
                                      : Colors.yellow,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                //! settings third button
                GestureDetector(
                  onTap: () async {
                    StudentHistory.historyList = [];
                    RemoteServices.ed.value = '';
                    from.emailInController.clear();
                    from.passwordInController.clear();
                    Hive.box('auth').clear();
                    Hive.box('lastQuizScore').clear();
                    Hive.box('lastQuestions').clear();
                    subjectsControllers.getSubjectsDone.value = false;
                    dropController.getstagesDone.value = false;
                    Subjects.deffultsubjects = [];
                    dropdownButtonController.stageList.value=[];
                    dropController.stageList.value = [];
                    c.isiniilized = false;
                    Get.offAll(LoginScreen());
                    await Future.delayed(
                        const Duration(milliseconds: 100));
                    NetQuiz.quizquestions = [];
                    signoutC.deleteDependencies();

                  },
                  child: PurpleContainer(
                    H: 40,
                    W: 350,
                    withShadow: false,
                    child: MyText(
                      myText: 'sign_out'.tr,
                      mysize: 20,
                      mycolor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
