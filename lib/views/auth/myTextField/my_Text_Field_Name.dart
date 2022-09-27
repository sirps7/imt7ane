
import 'package:amti7ane_unicoding/controllers/ahmedController/email_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyTextFiledName extends StatelessWidget {
   MyTextFiledName({Key? key}) : super(key: key);

   final from = Get.find<MyControllerAuth>();
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:const BoxConstraints(

        maxWidth: 300.0,
        minWidth: 300.0,
      ),
      margin: EdgeInsets.only(top: 25, left: 57, right: 57),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('full_name'.tr,style:  TextStyle(
              color: Colors.black,
              fontSize: 15,
             fontFamily: 'fonts'.tr
          ),),
          const SizedBox(height: 10,),
          TextFormField(
            controller: from.nameController,

            validator: (value){
              if(value!.isEmpty || !RegExp(r'^[a-z A-Z -]+$').hasMatch(value)){
                return " Enter Correct name";
              }else{
                return null;
              }
            },

            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
              constraints:const  BoxConstraints(maxHeight: 70),
              enabledBorder: OutlineInputBorder(
                borderSide:const BorderSide(
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
                borderSide:const BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon:const Icon(Icons.person_outline_rounded,size: 20,color: Color(0xff555555),),

              hintText: 'your_full_name'.tr,
              hintStyle: TextStyle(
                  color: Color(0xff555555),
                  fontSize: 12,
                fontFamily: 'fonts'.tr
              ),

            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

