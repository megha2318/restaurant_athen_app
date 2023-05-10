import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({Key? key, this.flow}) : super(key: key);

  String? flow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(3.14),
                  child: Image.asset(
                    AssetRes.twoCircleBgImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  // SizedBox(
                  //   height: Get.height * 0.03,
                  // ),
                  InkWell(
                    onTap: () {
                      (flow == "ps")
                          ? Get.offNamedUntil(
                              AppRes.loginPage, (route) => false)
                          : Get.offNamedUntil(
                              AppRes.homePage, (route) => false);
                    },
                    child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset(
                        AssetRes.doneImg,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Text(
                    (flow == "ps")
                        ? Strings.yaahSuccessful.tr
                        : Strings.doneSuccessful.tr,
                    textAlign: TextAlign.center,
                    style: appTextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Text(
                    (flow == "ps")
                        ? Strings.successfulPasswordTxt.tr
                        : Strings.doneTxt.tr,
                    textAlign: TextAlign.center,
                    style: appTextStyle(
                        fontSize: 11,
                        color: ColorRes.greyClr,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
