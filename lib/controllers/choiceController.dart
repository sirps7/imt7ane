import 'package:get/get.dart';

class ChoiceController extends GetxController {
  RxString selectedChoice = ''.obs;

  List<String> choices = [
    'العالم نيوتن',
    'العالم اينشتاين',
    'العالم تسلا',
  ];
}
