import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/notifications/controllers/notifications_controller.dart';

class NotificationsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}
