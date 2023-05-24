import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/profile_api.dart';
import 'package:restaurant_athen_app/screens/signup_screen/signup_controller.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

Widget appBar({bool? isBack, String? flow}) {
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
                  // (flow == "hm") ?
                  Get.back();
                  // : Get.offNamedUntil(AppRes.loginPage, (route) => false);
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

Widget appBarHome({required String title, required BuildContext context}) {
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
          heroTag: 'equal',
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
          heroTag: "not",
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

SignupController signupController = Get.put(SignupController());

Widget drawer() {
  return Drawer(
    child: SafeArea(
      child: Column(
        children: [
          // SizedBox(
          //   height: Get.height * 0.1,
          // ),
          Padding(
            padding: EdgeInsets.only(right: Get.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          SizedBox(
              height: 80,
              child: Image.asset(
                AssetRes.logoImg,
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
            padding: EdgeInsets.only(
                left: Get.width * 0.05, right: Get.width * 0.05),
            width: Get.width,
            height: Get.height * 0.07,
            color: ColorRes.backgroundColor.withOpacity(0.8),
            child: InkWell(
                onTap: () async {
                  Get.back();
                  signupController.profileModel.value =
                      await ProfileApi.profileApi();

                  signupController.firstNameCon.value.text =
                      signupController.profileModel.value.firstName ?? "";
                  signupController.nameCon.value.text =
                      signupController.profileModel.value.lastName ?? "";
                  signupController.userNameCon.value.text =
                      signupController.profileModel.value.username ?? "";
                  signupController.emailIdCon.value.text =
                      signupController.profileModel.value.email ?? "";
                  signupController.contactNumCon.value.text =
                      signupController.profileModel.value.phoneNumber ?? "";
                  signupController.addressCon.value.text =
                      signupController.profileModel.value.address ?? "";
                  signupController.postCodeCon.value.text =
                      signupController.profileModel.value.zipcode ?? "";
                  signupController.city.value.text =
                      signupController.profileModel.value.cityName ?? "";
                  signupController.joinDateCon.value.text = signupController
                      .profileModel.value.joinDate
                      .toString()
                      .split(' ')[0];
                  signupController.vacationDaysCon.value.text = signupController
                          .profileModel.value.amountOfVacationDays ??
                      "";
                  signupController.empNrCon.value.text =
                      signupController.profileModel.value.employeeNumber ?? "";
                  signupController.workingHoursCon.value.text =
                      signupController.profileModel.value.amountOfHoursWork ??
                          "";

                  print(
                      "================================ PROFILE IMG ${signupController.profileModel.value.profile}");

                  signupController.imageUrl =
                      signupController.profileModel.value.profile ?? "";

                  // signupController.list = await CityListApi.cityListApi();

                  Get.toNamed(AppRes.signupPage);
                },
                child: Row(
                  children: [
                    Icon(Icons.person_outline_rounded),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Text(
                      "Profile",
                      style: appTextStyle(fontSize: 16, color: ColorRes.black),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.only(
                left: Get.width * 0.05, right: Get.width * 0.05),
            width: Get.width,
            height: Get.height * 0.07,
            color: ColorRes.backgroundColor.withOpacity(0.8),
            child: InkWell(
                onTap: () async {
                  Get.back();
                  PrefService.setValue(PrefKeys.login, false);
                  Get.offNamedUntil(AppRes.loginPage, (route) => false);
                },
                child: Row(
                  children: [
                    const Icon(Icons.logout_rounded),
                    SizedBox(
                      width: Get.width * 0.05,
                    ),
                    Text(
                      "logoutBtn".tr,
                      style: appTextStyle(fontSize: 16, color: ColorRes.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ),
  );
}
