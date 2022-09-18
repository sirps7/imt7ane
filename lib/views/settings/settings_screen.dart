import 'package:amti7ane_unicoding/controllers/BottomNavigation_controller.dart';
import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/controllers/setting_controller.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/myFonts.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:amti7ane_unicoding/models/settings_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final SettingController settingController = Get.find();
  final TextEditingController mycntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mycntroller.text = 'محمد صالح';

    return SizedBox(
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
              child: const Image(
                image: AssetImage(
                  'assets/images/profile_image.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),

            //! settings first button
            SettingsButton(
              condtion: settingController.profilebutton,
              wichicon: settingController.profilebutton,
              title: 'Profile Settings',
              ontap: () {
                settingController.toogleprofile();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyText(
                    myText: 'Name',
                    mysize: 15,
                    mycolor: Colors.grey,
                    family: 'PoppinsMedium',
                  ),
                  TextFormField(
                    controller: mycntroller,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontFamily: 'SFMarwa', fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MyText(
                    myText: 'Stage',
                    mysize: 15,
                    mycolor: Colors.grey,
                    family: 'PoppinsMedium',
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
                      width: 150,
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 10,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: GetX<DropdownButtonController>(
                            builder: (dropController) {
                          return DropdownButton<String>(
                            icon: const Expanded(
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            dropdownColor: Colors.white,
                            value: dropController.selectedItem2.value,
                            borderRadius: BorderRadius.circular(10),
                            items: dropController.stageList
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: MyText(
                                      family: 'SFMarwa',
                                      myText: item,
                                      mysize: 20,
                                      mycolor: Colors.black,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              dropController.selectedItem2.value = value!;
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
                  const MyText(
                    myText: 'Gender',
                    mysize: 15,
                    mycolor: Colors.grey,
                    family: 'PoppinsMedium',
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
                      width: 150,
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
                            value: bottomNavController.genderSelectedItem.value,
                            items: bottomNavController.buttomNavSettingsGender
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
                      child: PurpleContainer(
                        color: const Color.fromARGB(255, 129, 133, 241),
                        H: 50,
                        W: 120,
                        child: MyText(
                          myText: 'Save',
                          mysize: 20,
                          mycolor: Colors.white,
                          family: MyFont.poppinsMedium,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            //! settings secound button
            SettingsButton(
                ontap: () {
                  settingController.tooglelanguageButton();
                },
                title: 'Language        ',
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
                            if (controller.language.value != 'EN') {
                              controller.tooglelanguage();
                            }
                          },
                          child: PurpleContainer(
                            H: 35,
                            W: 65,
                            withShadow: false,
                            child: MyText(
                              myText: 'EN',
                              mysize: 20,
                              mycolor: controller.language.value == 'AR'
                                  ? Colors.white
                                  : Colors.yellow,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.language.value != 'AR') {
                              controller.tooglelanguage();
                            }
                          },
                          child: PurpleContainer(
                            H: 35,
                            W: 65,
                            withShadow: false,
                            child: MyText(
                              myText: 'AR',
                              mysize: 20,
                              mycolor: controller.language.value == 'EN'
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
              onTap: () {},
              child: const PurpleContainer(
                H: 40,
                W: 350,
                withShadow: false,
                child: MyText(
                  myText: 'Sign out',
                  mysize: 20,
                  mycolor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
