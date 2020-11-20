import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/widgets/fancy_bottombar/fancy_bottombar_controller.dart';

class FancyBottomBar extends GetView<FancyBottomBarController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kNavBarColor,
        boxShadow: [
          BoxShadow(
            color: kNavBarColor.withOpacity(0.4),
            spreadRadius: 10,
            blurRadius: 30,
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            controller.iconSet.length,
            (index) => GetBuilder<FancyBottomBarController>(
              builder: (_) => buildRawMaterialButton(index),
            ),
          ),
        ),
      ),
    );
  }

  BouncingWidget buildRawMaterialButton(index) {
    var glow = '_glow';
    return BouncingWidget(
      onPressed: () {
        controller.changeFocus(index);
      },
      child: MaterialButton(
        minWidth: 0,
        height: 50,
        focusColor: Colors.transparent,
        highlightColor: kPrimaryBlueColor.withOpacity(0.5),
        splashColor: kPrimaryBlueColor.withOpacity(0.5),
        onPressed: null,
        shape: CircleBorder(),
        child: Stack(
          children: <Widget>[
            index == controller.currentIndex
                ? Container(
                    height: 22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: kWhiteColor.withOpacity(0.4),
                            spreadRadius: index != 2 ? 13 : 18,
                            blurRadius: index != 2 ? 11 : 18,
                            offset: index != 2 ? Offset(10, 0) : Offset(15, 0),
                          ),
                        ]),
                  )
                : Container(
                    height: 22,
                  ),
            SvgPicture.asset(
              index != controller.currentIndex
                  ? controller.iconSet[index]["image"] + '.svg'
                  : controller.iconSet[index]["image"] + glow + '.svg',
              height: index == 2 ? 35 : 18,
            ),
          ],
        ),
      ),
    );
  }
}
