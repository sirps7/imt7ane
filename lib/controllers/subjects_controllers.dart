import 'dart:convert';
import 'package:amti7ane_unicoding/models/networking/deffult_subjects.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class SubjectsControllers extends GetxController {
  Dio dio = Dio();
  RxBool getSubjectsDone = false.obs;

//! Subjects images
  Map<String, String> subImage = {
    'الفيزياء': 'assets/images/subjects_icons/pysics_sub.png',
    'العربي': 'assets/images/subjects_icons/adab_icon.png',
    'الرياضيات': 'assets/images/subjects_icons/Math_sub.png',
    'الاحياء': 'assets/images/subjects_icons/bio_sub.png',
    'الكيمياء': 'assets/images/subjects_icons/chemical_sub.png',
    'الإنكليزي': 'assets/images/subjects_icons/english_sub.png',
    'الجغرافيا': 'assets/images/subjects_icons/geo_sub.png',
    'العلوم': 'assets/images/subjects_icons/sciences.png',
    'الاسلاميه': 'assets/images/subjects_icons/quran.png',
    'القواعد': 'assets/images/subjects_icons/roles.png',
    'الادب والنصوص': 'assets/images/subjects_icons/adab.png',
    'الاجتماعيات': 'assets/images/subjects_icons/social.png',
    'التاريخ': 'assets/images/subjects_icons/history.png',
    'علم الاجتماع': 'assets/images/subjects_icons/Sociology.png',
    'الاقتصاد': 'assets/images/subjects_icons/Economy.png',
    'الفلسفه وعلم النفس': 'assets/images/subjects_icons/Psychology.png',
    'النقد الادبي': 'assets/images/subjects_icons/Literary criticism.png',
  };

  void getDeffultSubjects() async {
    Response response = await dio.get(
        'https://2135c43d-3381-469a-ba16-53687fa88f1a.mock.pstmn.io/api/subjects/get_defualt_subjects');
    Subjects.fromJson(jsonDecode(response.toString()));
    print(response.statusCode);
    print(Subjects.deffultsubjects[0].name);
    getSubjectsDone.value = true;
  }
}
