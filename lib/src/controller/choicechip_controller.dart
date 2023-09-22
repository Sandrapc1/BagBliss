import 'package:get/get.dart';

class ChoiceButtonController extends GetxController {
  var selectedChoiceButton=''.obs;

  void updateChoiceButton( String choice){
    selectedChoiceButton.value=choice;
  }
}