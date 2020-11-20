import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/widgets/post/post_controller.dart';

class Post extends GetView<PostController> {
  final int index;
  Post(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: ImageContainer(index: index),
    );
  }
}

class ImageContainer extends StatelessWidget {
  ImageContainer({
    Key key,
    @required this.index,
    this.shadowColor,
  }) : super(key: key);

  final PostController controller = Get.find();
  final int index;
  final shadowColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 350,
            child: Stack(
              children: <Widget>[
                buildPost(),
                buildPostMenuButton(),
                buildPostHeader(),
              ],
            ),
          ),
          buildReactionsBar()
        ],
      ),
    );
  }

  Positioned buildPost() {
    return Positioned(
      top: 45,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(controller.posts[index]["image"]),
          ),
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: controller.posts[index]["dominantColor"].withOpacity(0.5),
              spreadRadius: 13,
              blurRadius: 35,
              offset: Offset(0, 30),
            )
          ],
        ),
      ),
    );
  }

  Positioned buildPostMenuButton() {
    return Positioned(
      right: 20,
      top: 60,
      child: BouncingWidget(
        onPressed: () {},
        child: SvgPicture.asset(
          'assets/icons/menu.svg',
          height: 30,
          color: kWhiteColor.withOpacity(0.6),
        ),
      ),
    );
  }

  Positioned buildPostHeader() {
    return Positioned(
      left: 20,
      top: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 30,
            backgroundImage:
                AssetImage(controller.posts[index]["profileImage"]),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(controller.posts[index]["userName"]),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.black54,
                  ),
                  Text(
                    controller.posts[index]["location"],
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Positioned buildReactionsBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: 300,
      child: Row(
        children: <Widget>[
          Spacer(),
          Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade200, kWhiteColor]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                controller.iconSet.length,
                (index) => buildRawMaterialButton(index),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  BouncingWidget buildRawMaterialButton(index) {
    return BouncingWidget(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            SvgPicture.asset(
              controller.iconSet[index]["image"],
              color: index == 0 ? Colors.red : kNavBarColor,
              height: 20,
            ),
            SizedBox(
              width: 5,
            ),
            index == 0 || index == 1
                ? Text(controller.iconSet[index]["count"])
                : Text(''),
          ],
        ));
  }
}
