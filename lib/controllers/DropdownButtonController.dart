import 'package:get/get.dart';

class DropdownButtonController extends GetxController {
  List<String> GanderList = ['Male', 'Female'];
  RxString selectedItem1 = 'Male'.obs;

  List<String> stageList = ['اول متوسط', 'ثاني متوسط', 'ثالث متوسط'];
  RxString selectedItem2 = 'اول متوسط'.obs;
}
