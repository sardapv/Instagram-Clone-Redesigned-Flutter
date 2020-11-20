import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/screens/home/controllers/home_controller.dart';

class StoryBar extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: <Widget>[
            buildAddStoryButton(),
            Row(
              children: List.generate(
                10,
                (index) => buildStoryIcon(index),
              ),
            )
          ],
        ),
      ),
    );
  }

  BouncingWidget buildStoryIcon(index) {
    HomeController controller = Get.find();
    return BouncingWidget(
      onPressed: () {
        controller.openStoryPost();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                gradient: kInstaGradient,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image(
                          image:
                              AssetImage(controller.profiles[index]["image"]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              controller.profiles[index]["name"],
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  BouncingWidget buildAddStoryButton() {
    return BouncingWidget(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: kBlackColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: kBlackColor.withOpacity(0.1),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 35,
                        color: kBlackColor.withOpacity(0.2),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'My Story',
              style: TextStyle(
                fontSize: 12,
                color: kBlackColor.withOpacity(0.7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
