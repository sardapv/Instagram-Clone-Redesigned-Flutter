import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var username = "";
  var password = "";
  bool emailActive = false;
  bool passwordActive = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    usernameController.addListener(() {
      emailActive = true;
      update();
    });

    passController.addListener(() {
      passwordActive = true;
      update();
    });
  }

  resetIconColor() {
    emailActive = passwordActive = false;
    update();
  }

  openSignUpScreen() {}

  void unfocusTextFields(context) {
    FocusScope.of(context).unfocus();
  }

  void back() {
    Get.back();
  }
}
