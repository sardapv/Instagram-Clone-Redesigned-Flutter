import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/widgets/fancy_bottombar/fancy_bottombar_controller.dart';

class FancyBottomBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FancyBottomBarController());
  }
}
