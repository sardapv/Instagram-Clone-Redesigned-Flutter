import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/screens/story/story_controller.dart';

class Story extends GetView<StoryCotroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 150,
                color: kNavBarColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: buildStoryHeader(),
                      ),
                      buildStoryLoader()
                    ],
                  ),
                ),
              ),
              buildMainStoryPostImage()
            ],
          ),
          buildStoryMessageBar()
        ],
      ),
    ));
  }

  Row buildStoryHeader() {
    return Row(
      children: <Widget>[
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/profiles/profile10.png')),
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'beyond.the.sky',
                style: TextStyle(
                    fontSize: 17,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Today',
                style: TextStyle(color: kDarkGreyColor),
              )
            ],
          ),
        ),
        Spacer(),
        BouncingWidget(
          onPressed: () {},
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
            color: kWhiteColor,
            height: 25,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        BouncingWidget(
          onPressed: () {
            controller.close();
          },
          child: SvgPicture.asset(
            'assets/icons/close.svg',
            color: kWhiteColor,
            height: 25,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Stack buildStoryLoader() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: kDarkGreyColor, borderRadius: BorderRadius.circular(10)),
          width: Get.width,
          height: 3,
        ),
        Obx(
          () => AnimatedContainer(
            duration: Duration(seconds: 5),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(10)),
            width: controller.timer.toDouble(),
            height: 3,
          ),
        ),
      ],
    );
  }

  Container buildMainStoryPostImage() {
    return Container(
      color: kNavBarColor,
      child: Container(
        height: Get.height - 150,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/posts/post1.jpg'),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
    );
  }

  Positioned buildStoryMessageBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: <Widget>[
            Container(
              width: Get.width - 80,
              child: TextFormField(
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: kWhiteColor,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      color: kWhiteColor.withOpacity(0.7),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  hintText: 'Enter Your Message',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  filled: true,
                  suffixIcon: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    child: SvgPicture.asset(
                      'assets/icons/sharefill.svg',
                      height: 1,
                      color: kWhiteColor,
                    ),
                  ),
                  fillColor: Colors.transparent,
                  enabledBorder:
                      buildOutlineInputBorder(kWhiteColor.withOpacity(0.7)),
                  border: buildOutlineInputBorder(kWhiteColor.withOpacity(0.7)),
                  focusedBorder: buildOutlineInputBorder(kWhiteColor),
                ),
              ),
            ),
            Spacer(),
            BouncingWidget(
                child: SvgPicture.asset(
                  'assets/icons/fire.svg',
                  height: 40,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}
