import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class PostController extends GetxController {
  List posts = [
    {
      "image": "assets/images/posts/post1.jpg",
      "profileImage": "assets/images/profiles/profile1.png",
      "userName": "i.am.lisa",
      "location": "San Fransisco",
      "dominantColor": Color(0xff243818),
    },
    {
      "image": "assets/images/posts/post2.jpg",
      "profileImage": "assets/images/profiles/profile2.png",
      "userName": "jhondoe",
      "location": "Las Vegas",
      "dominantColor": Color(0xff260b09),
    },
    {
      "image": "assets/images/posts/post3.jpg",
      "profileImage": "assets/images/profiles/profile3.png",
      "userName": "loveforshoot",
      "location": "Andaman Islands",
      "dominantColor": Color(0xff274f5e),
    },
    {
      "image": "assets/images/posts/post4.jpg",
      "profileImage": "assets/images/profiles/profile4.png",
      "userName": "artist.man",
      "location": "Paris",
      "dominantColor": Color(0xff171717),
    },
    {
      "image": "assets/images/posts/post5.jpg",
      "profileImage": "assets/images/profiles/profile5.png",
      "userName": "studio.amaze.here",
      "location": "Jaipur",
      "dominantColor": Color(0xff904466),
    },
    {
      "image": "assets/images/posts/post6.jpg",
      "profileImage": "assets/images/profiles/profile6.png",
      "userName": "amit.jaju",
      "location": "Pune",
      "dominantColor": Color(0xff266064),
    },
    {
      "image": "assets/images/posts/post7.jpg",
      "profileImage": "assets/images/profiles/profile7.png",
      "userName": "smiley.emily",
      "location": "Somewhere on earth",
      "dominantColor": Color(0xff1a3905),
    },
    {
      "image": "assets/images/posts/post8.jpg",
      "profileImage": "assets/images/profiles/profile8.png",
      "userName": "model.stella",
      "location": "UStudio, Singapore",
      "dominantColor": Color(0xffda2201),
    },
    {
      "image": "assets/images/posts/post9.jpg",
      "profileImage": "assets/images/profiles/profile9.png",
      "userName": "cap.josh",
      "location": "Seattle",
      "dominantColor": Color(0xff163501),
    },
    {
      "image": "assets/images/posts/post10.jpg",
      "profileImage": "assets/images/profiles/profile10.png",
      "userName": "beyondthesky",
      "location": "Maldives",
      "dominantColor": Color(0xff84a7b7),
    },
  ];

  List iconSet = [
    {
      "image": "assets/icons/likebtn.svg",
      "count": "23K",
    },
    {
      "image": "assets/icons/commentbtn.svg",
      "count": "2.3K",
    },
    {
      "image": "assets/icons/sharebtn.svg",
    },
    {
      "image": "assets/icons/fullscrbtn.svg",
    },
  ];
  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.darkVibrantColor?.color != null
        ? paletteGenerator.darkVibrantColor?.color
        : paletteGenerator.dominantColor?.color;
  }
}
