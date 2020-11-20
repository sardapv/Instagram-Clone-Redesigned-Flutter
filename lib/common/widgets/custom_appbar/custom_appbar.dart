import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:instagram_clone_flutter/common/constants/bounceeffect.dart';
import 'package:instagram_clone_flutter/common/constants/colorconstants.dart';
import 'package:instagram_clone_flutter/common/widgets/custom_appbar/custom_appbar_controller.dart';

class CustomAppBar extends GetView<CustomAppBarController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: SvgPicture.asset(
                'assets/images/Instagram_logo.svg',
                height: 30,
              ),
            ),
          ),
          Spacer(),
          Row(
            children: List.generate(
              controller.iconSet.length,
              (index) => buildRawMaterialButton(index),
            ),
          )
        ],
      ),
    ));
  }

  BouncingWidget buildRawMaterialButton(index) {
    return BouncingWidget(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 0),
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
              SvgPicture.asset(
                controller.iconSet[index]["image"],
                height: 22,
                color: kBlackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
