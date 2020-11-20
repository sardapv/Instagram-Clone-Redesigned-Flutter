import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/widgets/custom_appbar/custom_appbar_controller.dart';

class CustomAppBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomAppBarController());
  }
}
