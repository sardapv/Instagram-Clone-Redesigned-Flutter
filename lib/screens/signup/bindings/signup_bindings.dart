import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/signup/controllers/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
