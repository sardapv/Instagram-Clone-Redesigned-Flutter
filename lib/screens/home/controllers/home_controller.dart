import 'package:get/get.dart';
import 'package:instagram_clone_flutter/screens/story/story.dart';
import 'package:instagram_clone_flutter/screens/story/story_bindings.dart';

class HomeController extends GetxService {
  List profiles = [
    {
      "image": "assets/images/profiles/profile1.png",
      "name": "Kristen",
    },
    {
      "image": "assets/images/profiles/profile2.png",
      "name": "Rony",
    },
    {
      "image": "assets/images/profiles/profile3.png",
      "name": "Albert",
    },
    {
      "image": "assets/images/profiles/profile4.png",
      "name": "Saun",
    },
    {
      "image": "assets/images/profiles/profile5.png",
      "name": "Lisa",
    },
    {
      "image": "assets/images/profiles/profile6.png",
      "name": "Julie",
    },
    {
      "image": "assets/images/profiles/profile7.png",
      "name": "Hannah",
    },
    {
      "image": "assets/images/profiles/profile8.png",
      "name": "Michael",
    },
    {
      "image": "assets/images/profiles/profile9.png",
      "name": "Jonas",
    },
    {
      "image": "assets/images/profiles/profile10.png",
      "name": "Kathrina",
    }
  ];

  openStoryPost() {
    Future.delayed(Duration(milliseconds: 200), () {
      Get.to(
        Story(),
        binding: StoryBindings(),
        transition: Transition.downToUp,
        duration: Duration(milliseconds: 200),
      );
    });
  }
}
