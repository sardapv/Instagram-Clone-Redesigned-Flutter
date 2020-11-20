import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/home/bindings/home_bindings.dart';
import 'package:instagram_clone_flutter/screens/home/views/home.dart';
import 'package:instagram_clone_flutter/screens/signin/bindings/signin_binding.dart';
import 'package:instagram_clone_flutter/screens/signin/views/signin.dart';
import 'package:instagram_clone_flutter/screens/signup/bindings/signup_bindings.dart';
import 'package:instagram_clone_flutter/screens/signup/views/sign_up.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icons' color
  ));
  runApp(MyApp());
  Future.wait([
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/like.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, 'assets/images/mention.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, 'assets/images/social_media.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, 'assets/images/user_avatar.svg'),
      null,
    ),
    precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, 'assets/images/chat.svg'),
      null,
    ),
    // other SVGs or images here
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      initialRoute: "/signup",
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/signup',
          page: () => SignUp(),
          binding: SignUpBindings(),
        )
      ],
    );
  }
}
