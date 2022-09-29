import 'package:dio/dio.dart';

class Server {
  static Dio dio = Dio();
  static String baseUrl = 'https://amt7ani.herokuapp.com';
  static String getDeffultSubjectsPath = '/api/subjects/get_default_subject';
  static String getDeffultQuizesPath = '/api/Quiz/get_defualt_quiz_lists';
  static String getQuizesPath = '/api/Quiz/get_quiz_lists';
  static String getStagesPath = '/api/subjects/get_stages';
  static String getQuizPath = '/api/Quiz/get_quiz';
  static String getProfileInfoPath = '/api/profile/profile_info';
  static String sendSettingChangePath = '/api/profile/update_profile';
  static String getSubjectsWithStageId = '/api/subjects/get_subjects';
  static String sendQuizpath = '/api/quizLog/post_quiz_history';
  static String getQuizesHistoryPath = '/api/quizLog/get_quizzes_history';
  static String getAvgAndTotalPath = '/api/quizLog/get_avg_n_total';
  static late String userToken;

  static Options token = Options(
    responseType: ResponseType.json,
    headers: {
      'Authorization': 'Bearer $userToken',
      'accept': 'application/json;charset=utf-8',
    },
  );
}
