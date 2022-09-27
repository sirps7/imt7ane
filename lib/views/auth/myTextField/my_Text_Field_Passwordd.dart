import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
class MyTextFiledPassword extends StatelessWidget {
  MyTextFiledPassword({Key? key,required this.thisController, required this.text, this.compareContoller,  this.noValid}) : super(key: key);

  final from = Get.find<MyControllerAuth>();
  final thisController;
  final String text;
  final compareContoller;
  final bool? noValid;

  @override
  Widget build(BuildContext context) {
    RxBool myObscureText = true.obs;
    RxString follow=''.obs;

    return Container(
        constraints:const BoxConstraints(
          maxWidth: 300.0,
          minWidth: 300.0,
        ),
      margin: EdgeInsets.only(top: 25, left: 57, right: 57),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(text.tr,
            style:  TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'fonts'.tr),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            return TextFormField(
              controller: thisController,
              onChanged: (x){
                follow.value=x;
              },
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              validator: noValid==true?null :(value) {
                if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
                  return "One uppercase";
                }else if (value.isEmpty || !RegExp(r'^(?=.*?[a-z])').hasMatch(value)){
                  return "One lowercase";
                }else if (value.isEmpty || !RegExp(r'.{9,}$').hasMatch(value)){
                  return" 9 letter long";
                } else if(compareContoller!=null){
                  if (compareContoller.text!=thisController.text)
                    return('password don\'t match');
                }
                else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              obscureText: myObscureText.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 0,top: 30),
                constraints: const BoxConstraints(maxHeight: 70),
                hintText: 'password'.tr,
                hintStyle:  TextStyle(
                  color: Color(0xff555555),
                  fontSize: 12,
                  fontFamily: 'fonts'.tr
                ),
                prefixIcon:const  Icon(
                  Icons.lock_outline_rounded,
                  size: 20,
                  color:  Color(0xff555555),
                ),
                suffixIcon:follow.value!=''? TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                    onPressed: () {
                      if (myObscureText.value) {
                        myObscureText.value = false;
                      } else {
                        myObscureText.value = true;
                      }
                    },
                    child:  Icon(
                      myObscureText.value == true
                          ? Ionicons.eye
                          : Ionicons.eye_off,
                      size: 20,
                      color: Color(0xff555555),
                    ),


                  ):null,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xffC4C4C4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0xff870DFF),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
              ),
            );
          }),
        ],
      ),
    );
  }
}
