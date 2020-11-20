import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/home/bindings/home_bindings.dart';
import 'package:instagram_clone_flutter/screens/home/views/home.dart';
import 'package:instagram_clone_flutter/screens/signin/bindings/signin_binding.dart';
import 'package:instagram_clone_flutter/screens/signin/views/signin.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var welcomeScreenIndex = 0;

  List welcomeScreens = [
    {
      "image": "assets/images/social_media.svg",
      "color": 0xfffcdb8b,
      "indicolor": 0xff905300
    },
    {
      "image": "assets/images/user_avatar.svg",
      "color": 0xfffc6fb5,
      "indicolor": 0xff8C0944
    },
    {
      "image": "assets/images/mention.svg",
      "color": 0xffF6CEC7,
      "indicolor": 0xff896059
    },
    {
      "image": "assets/images/like.svg",
      "color": 0xffADD9FF,
      "indicolor": 0xff14416A
    },
    {
      "image": "assets/images/chat.svg",
      "color": 0xfffcdb8b,
      "indicolor": 0xffC08120
    }
  ];

  openMessenger() {
    Get.to(
      Home(),
      binding: HomeBindings(),
      transition: Transition.size,
      duration: Duration(milliseconds: 400),
    );
  }

  emailSignIn() {
    Get.to(
      SignIn(),
      binding: SignInBinding(),
      transition: Transition.cupertino,
      duration: Duration(milliseconds: 400),
    );
  }

  void updateActiveScreenIndex(index) {
    welcomeScreenIndex = index;
    update();
  }
}
