// import 'dart:io';
// import 'dart:convert';

import 'package:amti7ane_unicoding/models/JsonModels/stages.dart';

import 'package:http/http.dart' as http;

class RemoteServices{
  static var client = http.Client();
 static Future<List<Stages>?> get_stage() async {
   var response = await client.get( Uri.parse("https://amt7ani.herokuapp.com/api/auth/get_stages"),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
      if(response.statusCode == 200){
        var jsonString = response.body;
        var a=Stages.stageFromJson(jsonString);
        return a;
      }

  }
}