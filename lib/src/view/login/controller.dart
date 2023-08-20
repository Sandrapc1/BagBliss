
import 'package:get/get.dart';

class LoginController {
  RxBool obscureText=true.obs;

  void toggleLoginVisiblisty(){
    obscureText.toggle();
  }
  
}