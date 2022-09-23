import 'package:get/get.dart';

class ChoiceController extends GetxController {
  bool heSelectOneOfChoices = false;

  RxString selectedChoice = ''.obs; //todo

  List<String> choices = [
    //todo
    'العالم نيوتن',
    'العالم اينشتاين',
    'العالم تسلا',
  ];
}
