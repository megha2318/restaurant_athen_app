import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

Widget button(
    {required String txt,
    required void Function()? onTap,
    double? fontSize,
    Color? color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: Get.height * 0.065,
      width: Get.width,
      // margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
      decoration: BoxDecoration(
          color: color ?? ColorRes.color74BDCB,
          borderRadius: BorderRadius.circular(99)),
      child: Text(
        txt.tr,
        style: appTextStyle(
          fontSize: fontSize ?? 16,
        ),
      ),
    ),
  );
}
