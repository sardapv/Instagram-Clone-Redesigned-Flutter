import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/constants/textstyleconstants.dart';
import 'package:instagram_clone_flutter/screens/signin/controllers/signin_controller.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/widgets/large_button.dart';

class SignIn extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.unfocusTextFields(context);
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: buildAppBar(),
        body: Center(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Form(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign in to',
                        style: kSignInHeaderStyle,
                      ),
                      Text(
                        'Instagram',
                        style: kSignInHeaderStyle,
                      ),
                      buildHeightSizedBox(12),
                      Text(
                        'Enter your details below',
                        style: kRegularStyle,
                      ),
                      buildHeightSizedBox(40),
                      FormField(
                        key: Key('username'),
                      ),
                      FormField(
                        key: Key('password'),
                      ),
                      buildHeightSizedBox(15),
                      BouncingWidget(
                        scaleFactor: 0.7,
                        onPressed: () {
                          controller.unfocusTextFields(context);
                          controller.openSignUpScreen();
                        },
                        child: LargeButton(
                          showIcon: false,
                          borderColor: kBlackColor,
                          buttonText: 'Sign in',
                          fillColor: kBlackColor,
                          buttonTextColor: Colors.white,
                        ),
                      ),
                      buildHeightSizedBox(20),
                      BouncingWidget(
                        onPressed: () {},
                        child: Text(
                          'Not a member? Signup now',
                          style: TextStyle(
                            color: kPrimaryBlueColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildHeightSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kWhiteColor,
      leading: IconButton(
        color: kBlackColor,
        icon: SvgPicture.asset('assets/icons/ios-back.svg'),
        onPressed: () {
          controller.back();
        },
      ),
    );
  }
}

class FormField extends StatelessWidget {
  FormField({
    Key key,
  }) : super(key: key);

  final SignInController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        key.toString().contains('username')
                            ? 'Username or Email'
                            : 'Password',
                        style: TextStyle(fontSize: 14),
                      ),
                      key.toString().contains('password')
                          ? BouncingWidget(
                              onPressed: () {},
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: kPrimaryBlueColor,
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : Text(''),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [buildBoxShadow()]),
                    child: TextFormField(
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                      ),
                      obscureText: key.toString().contains('password'),
                      controller: key.toString().contains('username')
                          ? controller.usernameController
                          : controller.passController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.black38, fontWeight: FontWeight.w400),
                        hintText: key.toString().contains('username')
                            ? 'Enter your username or email'
                            : 'Enter your password',
                        prefixIcon: buildSvgPicture(),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: buildOutlineInputBorder(Colors.white),
                        border: buildOutlineInputBorder(Colors.white),
                        focusedBorder:
                            buildOutlineInputBorder(kPrimaryBlueColor),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  BoxShadow buildBoxShadow() {
    return BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      blurRadius: 20,
      spreadRadius: 3,
      offset: Offset(0, 15),
    );
  }

  SvgPicture buildSvgPicture() {
    return SvgPicture.asset(
        key.toString().contains('username')
            ? (controller.emailActive
                ? 'assets/icons/email-act.svg'
                : 'assets/icons/email.svg')
            : (controller.passwordActive
                ? 'assets/icons/password-act.svg'
                : 'assets/icons/password.svg'),
        fit: BoxFit.scaleDown);
  }

  OutlineInputBorder buildOutlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderColor),
    );
  }
}

void unfocusTextFields(context) {
  FocusScope.of(context).unfocus();
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
