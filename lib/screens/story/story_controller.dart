import 'package:get/get.dart';

class StoryCotroller extends GetxController {
  var timer = 0.obs;

  @override
  void onInit() {
    super.onInit();
    timer = 0.obs;
  }

  @override
  void onReady() {
    timer = timer + Get.width.toInt();
  }

  @override
  void onClose() {
    timer = timer - Get.width.toInt();
  }

  close() {
    Get.back();
  }
}
