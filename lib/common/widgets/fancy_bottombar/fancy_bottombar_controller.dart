import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/notifications/bindings/notifications_bindings.dart';
import 'package:instagram_clone_flutter/screens/notifications/views/notifications.dart';

class FancyBottomBarController extends GetxController {
  List iconSet = [
    {
      "image": "assets/icons/home",
    },
    {
      "image": "assets/icons/search",
    },
    {
      "image": "assets/icons/add",
    },
    {
      "image": "assets/icons/likes",
    },
    {
      "image": "assets/icons/profile",
    }
  ];

  var currentIndex = 0;

  void changeFocus(index) {
    currentIndex = index;
    update();
    if (index == 3) {
      Get.to(
        Notifications(),
        binding: NotificationsBindings(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 400),
      );
    } else {
      Get.back();
    }
  }
}
