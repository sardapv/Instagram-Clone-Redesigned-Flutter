import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/signin/controllers/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
