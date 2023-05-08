import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

RestaurantAthenController restaurantAthenController =
    Get.put(RestaurantAthenController());

Widget titleWithRoundedCheck({
  required String title,
  bool? val,
  void Function()? onTap,
}) {
  return Container(
    padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.03),
    height: Get.height * 0.065,
    decoration: BoxDecoration(
      color: ColorRes.backgroundColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Text(
          title,
          style: appTextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: (val == true) ? ColorRes.black : ColorRes.greyClr,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: (val == true) ? ColorRes.color74BDCB : ColorRes.white,
              shape: BoxShape.circle,
            ),
            child: (val == true)
                ? const Icon(
                    Icons.check_rounded,
                    color: ColorRes.white,
                    size: 12,
                  )
                : SizedBox(),
          ),
        ),
      ],
    ),
  );
}
