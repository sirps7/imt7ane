import 'package:amti7ane_unicoding/controllers/DropdownButtonController.dart';
import 'package:amti7ane_unicoding/models/networking/deffult_subjects.dart';
import 'package:amti7ane_unicoding/models/networking/server_variable.dart';
import 'package:amti7ane_unicoding/models/networking/stages.dart';
import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';

class SubjectsControllers extends GetxController {
  RxBool getSubjectsDone = false.obs;
  RxBool getSubjectsWithIdDone = true.obs;

  DropdownButtonController dropdownButtonController = Get.find();

//! Subjects images
  Map<String, String> subImage = {
    'الفيزياء': 'assets/images/subjects_icons/pysics_sub.png',
    'العربي': 'assets/images/subjects_icons/adab_icon.png',
    'الرياضيات': 'assets/images/subjects_icons/Math_sub.png',
    'الاحياء': 'assets/images/subjects_icons/bio_sub.png',
    'الكيمياء': 'assets/images/subjects_icons/chemical_sub.png',
    'الانكليزي': 'assets/images/subjects_icons/english_sub.png',
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
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getDeffultSubjectsPath,
      options: Server.token,
    );
    Subjects.fromJson(response.data);
    getSubjectsDone.value = true;
  }

  void getSubjectsWithStageId() async {
    getSubjectsWithIdDone.value = false;
    Response response = await Server.dio.get(
      Server.baseUrl + Server.getSubjectsWithStageId,
      options: Server.token,
      queryParameters: {
        'stage_id': (Stages.stagesMap.firstWhere((e) =>
                e.containsKey(dropdownButtonController.selectedItem.value)))[
            dropdownButtonController.selectedItem.value]!,
      },
    );
    Subjects.deffultsubjects = [];
    Subjects.fromJson(response.data);
    getSubjectsWithIdDone.value = true;
  }
}
