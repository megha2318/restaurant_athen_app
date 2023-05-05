import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

Widget appBar({bool? isBack}) {
  return Container(
    margin: EdgeInsets.only(
      top: Get.height * 0.07,
    ),
    // padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
    height: Get.height * 0.12,
    width: Get.width,
    // color: ColorRes.black,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.02,
        ),
        (isBack == true)
            ? FloatingActionButton(
                backgroundColor: ColorRes.white,
                mini: true,
                elevation: 0.5,
                onPressed: () {
                  Get.offNamedUntil(AppRes.loginPage, (route) => false);
                },
                child: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: ColorRes.black,
                  size: 15,
                ),
              )
            : SizedBox(),
        Spacer(),
        Image.asset(AssetRes.logoImg),
      ],
    ),
  );
}

Widget appBarHome({required String title}) {
  return Container(
    margin: EdgeInsets.only(
      top: Get.height * 0.07,
    ),
    // padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
    // height: Get.height * 0.15,
    width: Get.width,
    // color: ColorRes.black,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.02,
        ),
        FloatingActionButton(
          backgroundColor: ColorRes.white,
          elevation: 0,
          mini: true,
          onPressed: () {},
          child: Transform.scale(
            scale: 0.3,
            child: Image.asset(AssetRes.equalIcon),
          ),
        ),
        Spacer(),
        Column(
          children: [
            SizedBox(
                height: 60,
                child: Image.asset(
                  AssetRes.logoImg,
                  fit: BoxFit.fitHeight,
                )),
            SizedBox(
              height: Get.height * 0.008,
            ),
            Text(
              title,
              style: appTextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        Spacer(),
        FloatingActionButton(
          backgroundColor: ColorRes.white,
          elevation: 0,
          mini: true,
          child: Transform.scale(
            scale: 0.4,
            child: Image.asset(AssetRes.notificationIcon),
          ),
          onPressed: () {},
        ),
      ],
    ),
  );
}
