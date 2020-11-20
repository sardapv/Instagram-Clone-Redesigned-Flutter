import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/screens/signup/controllers/sign_up_controller.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/widgets/large_button.dart';

class SignUp extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kWhiteColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: GetBuilder<SignUpController>(
                builder: (_) => Stack(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 0.5 * Get.height,
                      color: Color(controller
                              .welcomeScreens[controller.welcomeScreenIndex]
                          ["color"]),
                      child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        onPageChanged: (index) {
                          controller.updateActiveScreenIndex(index);
                        },
                        itemCount: controller.welcomeScreens.length,
                        itemBuilder: (context, index) => SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  controller.welcomeScreens[index]["image"],
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: List.generate(
                            controller.welcomeScreens.length,
                            (index) => buildSliderIndicator(index),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                GetBuilder<SignUpController>(
                  builder: (_) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 0.5 * Get.height,
                    color: Color(
                        controller.welcomeScreens[controller.welcomeScreenIndex]
                            ["color"]),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          BouncingWidget(
                            scaleFactor: 0.7,
                            onPressed: controller.openMessenger,
                            child: LargeButton(
                              showIcon: true,
                              icon: SvgPicture.asset(
                                'assets/icons/messenger.svg',
                                height: 35,
                              ),
                              borderColor: Colors.grey.withOpacity(0.5),
                              buttonText: 'Sign in with Facebook',
                              fillColor: Colors.white,
                              buttonTextColor: kBlackColor,
                            ),
                          ),
                          BouncingWidget(
                            onPressed: controller.emailSignIn,
                            scaleFactor: 0.7,
                            child: LargeButton(
                              showIcon: false,
                              borderColor: kBlackColor,
                              buttonText: 'Sign in with Email',
                              fillColor: kBlackColor,
                              buttonTextColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          BouncingWidget(
                            onPressed: () {},
                            child: Text(
                              'Not a member? Signup now',
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BouncingWidget(
                            onPressed: () {},
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: kPrimaryBlueColor,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      height: 0.5 * Get.height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildSliderIndicator(index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(3),
      height: 8,
      width: controller.welcomeScreenIndex == index ? 25 : 8,
      decoration: BoxDecoration(
        color: controller.welcomeScreenIndex == index
            ? Color(controller.welcomeScreens[index]["indicolor"])
            : Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
