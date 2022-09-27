import 'dart:io';


import 'dart:convert';
import 'package:amti7ane_unicoding/controllers/jsonControllers/code_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NewPasswordServices{
  static final codeC = Get.find<codeChecker>();
  static var client = http.Client();
  static RxInt sc=0.obs;
  static RxString ed=''.obs;
  static RxBool isloading=false.obs;
  static Future<int?> set_password(Map data) async {
    isloading.value=true;
    var response = await client.put(Uri.parse("https://amt7ani.herokuapp.com/api/auth/set_new_password"),
      headers: {'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader:'Bearer ${codeC.token}'},
      body:json.encode(data),
    );
    isloading.value=false;
    if(response.statusCode == 200){
      sc.value=200;
      var jsonString = response.body;
      return response.statusCode;
    }
    if(response.statusCode==400){
      sc.value=400;
      ed.value=(jsonDecode(response.body)['detail']);
    }
    else{
      print('dev error');
    }

  }
}