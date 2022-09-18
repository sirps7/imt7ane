import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextFiledPass extends StatelessWidget {
  const MyTextFiledPass({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    RxBool myObscureText = true.obs;
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 57, right: 57),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            return TextFormField(
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                        .hasMatch(value)) {
                  return "one uppercase and lowercase letter and a number, and not less than 8 places";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              obscureText: myObscureText.value,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                constraints: const BoxConstraints(maxHeight: 50),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color(0xff555555),
                  fontSize: 12,
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  size: 20,
                  color: Color(0xff555555),
                ),
                suffix: IconButton(
                    constraints: const BoxConstraints(maxHeight: 50),
                    onPressed: () {
                      if (myObscureText.value) {
                        myObscureText.value = false;
                      } else {
                        myObscureText.value = true;
                      }
                    },
                    icon: Icon(
                      myObscureText.value == true
                          ? Icons.remove_red_eye
                          : Icons.password,
                      size: 20,
                    )),
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
