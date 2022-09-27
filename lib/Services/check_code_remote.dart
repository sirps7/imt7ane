
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../controllers/jsonControllers/code_controller.dart';
import 'package:get/get.dart';
class code_Services{
  static final codeC = Get.find<codeChecker>();
  static var client = http.Client();
  static RxInt sc=0.obs;
  static RxString ed=''.obs;
  static RxBool isloading=false.obs;

  static Future<void> checkCode(Map data) async {
    isloading.value=true;
    var response = await client.post(Uri.parse("https://amt7ani.herokuapp.com/api/auth/check_code"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body:json.encode(data),
    );
    print(response.statusCode);
    isloading.value=false;
    if(response.statusCode == 200){
      sc.value=200;
      var jsonString = json.decode(response.body);
      codeC.token=jsonString['access'];}
    if(response.statusCode==400){
      sc.value=400;
      ed.value='code is incorrect';
      print(ed.value);
    }
      if(response.statusCode==403){
        sc.value=403;
        print('dev error, user not activated');
      }
      if(response.statusCode==404){
        sc.value=404;
        print('dev error, user not found');

      }


    }

  }
