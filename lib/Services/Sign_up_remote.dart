
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
class RemoteServices{
  static late var sc;
  static RxString ed=''.obs;
  static RxBool isloading=false.obs;
  static var client = http.Client();
  static Future<void> sign_up(Map data) async {
    isloading.value=true;
    var response = await client.post(Uri.parse("https://amt7ani.herokuapp.com/api/auth/signup"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body:json.encode(data),
    );
    isloading.value=false;
    sc=response.statusCode;
    if (sc!=202){
      ed.value=(jsonDecode(response.body)['detail']);
    }


  }
}