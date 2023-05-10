import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/common/text_field.dart';
import 'package:restaurant_athen_app/screens/forgot_password_screen/forgot_password_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            halfCircle(),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.05, right: Get.width * 0.05),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBar(isBack: true),
                      SizedBox(
                        height: Get.height * 0.018,
                      ),
                      Text(
                        Strings.forgotPassword.tr,
                        style: appTextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: Get.height * 0.002,
                      ),
                      Text(
                        Strings.forgotPasswordTxt.tr,
                        style: appTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorRes.greyClr),
                      ),
                      SizedBox(
                        height: Get.height * 0.08,
                      ),
                      textfield(
                        prefixImg: AssetRes.emailIcon,
                        controller: forgotPasswordController.emailIdCon.value,
                        hintTxt: Strings.emailId.tr,
                      ),
                      SizedBox(
                        height: Get.height * 0.33,
                      ),
                      button(
                          txt: Strings.send.tr,
                          onTap: () {
                            forgotPasswordController.sendOnTap();
                          }),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
