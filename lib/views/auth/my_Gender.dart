import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/models/mytext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyGender extends StatelessWidget {
  const MyGender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 57, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(myText: 'Gander', mysize: 15, family: 'Poppins'),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffC4C4C4), width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child:
                      GetX<DropdownButtonController>(builder: (dropController) {
                    return DropdownButton<String>(
                      // style: TextStyle(fontFamily: 'SFMarwa'),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff555555),
                        size: 20,
                      ),
                      dropdownColor: const Color(0xffC4C4C4),
                      value: dropController.selectedItem1.value,
                      borderRadius: BorderRadius.circular(10),
                      elevation: 0,
                      items: dropController.ganderList
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: MyText(
                                family: 'Poppins',
                                myText: item,
                                mysize: 15,
                                mycolor: const Color(0xff555555),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        dropController.selectedItem1.value = value!;
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
