import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/story/story_controller.dart';

class StoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryCotroller());
  }
}
