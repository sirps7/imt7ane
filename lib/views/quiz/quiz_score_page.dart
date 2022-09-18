import 'package:amti7ane_unicoding/controllers/controller_main.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/purple_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScore extends StatelessWidget {
  const QuizScore({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            //! score page text
            const MyText(
              myText: 'Score page',
              mysize: 30,
              family: 'Poppins',
            ),
            const SizedBox(
              height: 30,
            ),
            //! subject card
            Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                        'assets/images/subjects_icons/pysics_sub.png'),
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MyText(
                        myText: 'فيزياء',
                        mysize: 40,
                        isbold: true,
                        family: 'SFMarwa',
                        height: 1,
                      ),
                      MyText(
                        family: 'SFMarwa',
                        myText: 'الفصل الثاني',
                        mysize: 20,
                        mycolor: Colors.grey,
                        height: 1.5,
                      ),
                    ],
                  )
                ],
              ),
              //! subject card end
            ),
            const SizedBox(
              height: 30,
            ),
            //! your score
            const PurpleContainer(
              H: 55,
              W: 200,
              child: MyText(
                myText: 'Your Score 30',
                mysize: 25,
                family: 'Poppins',
                mycolor: Colors.white,
              ),
            ),
            //! Correct and Incorrect
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
              child: SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: MyColor.yColor,
                          radius: 35,
                          child: MyText(
                            myText: '7',
                            mysize: 40,
                            mycolor: Colors.black,
                            family: 'PoppinsMedium',
                          ),
                        ),
                        MyText(
                          myText: 'Correct',
                          mysize: 15,
                          family: 'PoppinsMedium',
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: MyColor.yColor,
                          radius: 35,
                          child: MyText(
                            myText: '3',
                            mysize: 40,
                            mycolor: Colors.black,
                            family: 'PoppinsMedium',
                          ),
                        ),
                        MyText(
                          myText: 'Incorrect',
                          mysize: 15,
                          family: 'PoppinsMedium',
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            //! Show The Correct Answers container
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => mainController.showSolutions.value = true,
              child: const PurpleContainer(
                H: 67,
                W: 240,
                child: Expanded(
                  child: MyText(
                    myText: 'Show The Correct Answers',
                    mysize: 20,
                    mycolor: Colors.white,
                    isbold: true,
                    height: 1.4,
                    family: 'PoppinsMedium',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
