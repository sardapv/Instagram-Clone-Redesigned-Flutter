import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/widgets/fancy_bottombar/fancy_bottombar.dart';
import 'package:instagram_clone_flutter/screens/notifications/controllers/notifications_controller.dart';

class Notifications extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomBar(),
    );
  }
}
