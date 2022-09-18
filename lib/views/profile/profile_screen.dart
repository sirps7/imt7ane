import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:amti7ane_unicoding/models/quiz_history.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! main image
          Container(
            alignment: Alignment.center,
            height: 230,
            color: MyColor.profileBackColor,
            width: double.infinity,
            child: const Image(
              image: AssetImage(
                'assets/images/reading_image.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //!first outlin border
                    Container(
                      height: 100,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColor.borderColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          MyText(
                            myText: 'Avg Score',
                            mysize: 17,
                            family: 'Poppinsbold',
                          ),
                          MyText(
                            myText: '75%',
                            mysize: 40,
                            family: 'Poppinsbold',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    //!secound outlin border
                    Container(
                      height: 100,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColor.borderColor,
                          width: 3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          MyText(
                            myText: 'Total Quizzes',
                            mysize: 17,
                            family: 'Poppinsbold',
                          ),
                          MyText(
                            myText: '12',
                            mysize: 40,
                            family: 'Poppinsbold',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //!Quiz History
                const MyText(
                  myText: 'Quiz History',
                  mysize: 35,
                ),
                const SizedBox(
                  height: 20,
                ),

                //!history
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 30,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const QuizHistory();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
