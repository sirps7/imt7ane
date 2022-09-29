import 'package:amti7ane_unicoding/models/JsonModels/User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class ver_email_Services{
  static var client = http.Client();
  static RxInt sc=0.obs;
  static RxString ed=''.obs;
  static RxBool isloading=false.obs;

  static Future<void> send_veri(Map data) async {
    isloading.value=true;
    var response = await client.post(Uri.parse("https://amt7ani.herokuapp.com/api/auth/password_reset_request"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body:json.encode(data),
    );
    isloading.value=false;

    if(response.statusCode == 202){
      sc.value=202;

    }
    else if (response.statusCode==404){
      sc.value=404;
      ed.value='email not registered';
    }
    else if (response.statusCode==403){
      sc.value=403;
      ed.value='email not activated';
    }

  }
}