import 'package:amti7ane_unicoding/models/lecture.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';

class SubjectLectures extends StatelessWidget {
  const SubjectLectures({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //!static elements
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.maxFinite,
                  color: Colors.white,
                  height: 270,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 43, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage('assets/images/lecturs_image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  height: 105,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.elliptical(20, 10),
                        right: Radius.elliptical(20, 10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage(
                                    'assets/images/subjects_icons/pysics_sub.png'),
                                height: 50,
                                width: 50,
                              ),
                              MyText(
                                myText: 'الفيزياء',
                                mysize: 20,
                                family: 'SFMarwa',
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              MyText(
                                myText: 'الامتحان الشامل',
                                mysize: 15,
                                family: 'SFMarwa',
                              ),
                              MyText(
                                myText: 'الوقت: 120 دقيقة',
                                mysize: 15,
                                family: 'SFMarwa',
                              ),
                              MyText(
                                myText: 'عدد الاسئلة : 100',
                                mysize: 15,
                                family: 'SFMarwa',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const MyText(
              myText: 'الفصول',
              mysize: 50,
              family: 'SFMarwa',
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 15,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 25,
                );
              },
              itemBuilder: (context, index) {
                return const Lecture();
              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
