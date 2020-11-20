import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/widgets/custom_appbar/custom_appbar_controller.dart';
import 'package:instagram_clone_flutter/common/widgets/fancy_bottombar/fancy_bottombar_controller.dart';
import 'package:instagram_clone_flutter/common/widgets/post/post_controller.dart';
import 'package:instagram_clone_flutter/screens/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FancyBottomBarController());
    Get.lazyPut(() => CustomAppBarController());
    Get.lazyPut(() => PostController());
  }
}
