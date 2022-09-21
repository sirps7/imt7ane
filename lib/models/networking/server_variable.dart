import 'package:dio/dio.dart';

class Server {
  static Dio dio = Dio();
  static String baseUrl =
      'https://2135c43d-3381-469a-ba16-53687fa88f1a.mock.pstmn.io';
  static String baseUrl1 = 'https://amt7ani.herokuapp.com';
  static String getDeffultSubjectsPath = '/api/subjects/get_default_subject';
  static String getDeffultQuizesPath = '/api/Quiz/get_defualt_quiz_lists';
  static String getStagesPath = '/api/subjects/get_stages';
  static String getQuizPath = '/api/Quiz/get_quiz';
  static Options token = Options(
    responseType: ResponseType.json,
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNyIsInVzZXJfZW1haWwiOiJBbGlfd2F0aGlrX3FrMzJAeWFob28uY29tIn0.ybx59HHbFvfLrmdGBErRGOGp7pkPvgj8La3WgBZEbtE',
      'accept': 'application/json;charset=utf-8',
    },
  );
}
