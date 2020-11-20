import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/widgets/custom_appbar/custom_appbar.dart';
import 'package:instagram_clone_flutter/common/widgets/fancy_bottombar/fancy_bottombar.dart';
import 'package:instagram_clone_flutter/common/widgets/post/post.dart';
import 'package:instagram_clone_flutter/screens/home/controllers/home_controller.dart';
import 'package:instagram_clone_flutter/screens/home/views/storybar.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: kNavBarColor,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: kWhiteColor,
        bottomNavigationBar: FancyBottomBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                CustomAppBar(),
                StoryBar(),
                Column(
                  children: List.generate(
                    10,
                    (index) => Post(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
