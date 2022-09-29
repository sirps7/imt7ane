
import 'package:amti7ane_unicoding/Services/Stage_remote.dart';
import 'package:amti7ane_unicoding/models/JsonModels/stages.dart';
import 'package:get/get.dart';



class StageController extends GetxController{
  RxList<Stages> stage = <Stages>[].obs;

  @override
  void onInit() {
    AddStages();
    super.onInit();
  }
  int find_stage(String stage_name){
    Stages st=stage.firstWhere((e) => e.stage==stage_name);
    return st.id;
  }
  Future<void> AddStages()  async {
    try {
      var Stage = await RemoteServices.get_stage();
      if (Stage != null) {
        stage.value = Stage as List<Stages>;
      }
    } finally {
    }

  }



}