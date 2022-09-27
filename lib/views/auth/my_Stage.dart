
import 'package:amti7ane_unicoding/controllers/DropdownButtonController_Ahmed.dart';
import 'package:amti7ane_unicoding/models/colors.dart';
import 'package:amti7ane_unicoding/models/mytext_Ahmed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyStage extends StatelessWidget {
  const MyStage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const BoxConstraints(

        maxWidth: 300.0,
        minWidth: 300.0,
      ),
      margin: const EdgeInsets.only(top: 20, left: 57, right: 57),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText_Ahmed(myText: 'stage'.tr, mysize: 15, family: 'fonts'.tr),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                height: 50,
                padding: const EdgeInsets.only( left: 20,  right: 20, ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color(0xffC4C4C4),
                      width: 1
                  ),
                ),

                child: DropdownButtonHideUnderline(
                  child: GetX<DropdownButtonController_Ahmed>(
                      builder: (dropController) {
                        return DropdownButton<String>(
                          // style: TextStyle(fontFamily: 'SFMarwa'),
                          menuMaxHeight: 300,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color:MyColor.mainColor,
                            size: 20,
                          ),
                          dropdownColor: Colors.white,
                          value: dropController.selectedItem2.value,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          items: dropController.stageList
                              .map(
                                (item) => DropdownMenuItem(
                              value: item,
                              child: MyText_Ahmed(
                                family: 'SFMarwa',
                                myText: item,
                                mysize: 15,
                                mycolor: const Color(0xff555555),
                              ),
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            dropController.selectedItem2.value = value!;
                            print(dropController.selectedItem2.value);
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