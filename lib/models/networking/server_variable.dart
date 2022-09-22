import 'package:dio/dio.dart';

class Server {
  static Dio dio = Dio();
  static String baseUrl = 'https://amt7ani.herokuapp.com';
  static String getDeffultSubjectsPath = '/api/subjects/get_default_subject';
  static String getDeffultQuizesPath = '/api/Quiz/get_defualt_quiz_lists';
  static String getStagesPath = '/api/subjects/get_stages';
  static String getQuizPath = '/api/Quiz/get_quiz';
  static String getProfileInfoPath = '/api/profile/profile_info';
  static String sendSettingChangePath = '/api/profile/update_profile';
  static Options token = Options(
    responseType: ResponseType.json,
    headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMiIsInVzZXJfZW1haWwiOiJ1c2VyMTJAZ21haWwuY29tLmNvbSJ9.rFsBS1TFHDRfJg2TW8ocqlD_KVTJwlaxrMUmMhpBQBI',
      'accept': 'application/json;charset=utf-8',
    },
  );
}
