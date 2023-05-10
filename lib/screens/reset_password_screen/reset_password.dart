import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/checkbox.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/screens/reset_password_screen/reset_password_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final ResetPasswordController resetPasswordController =
      Get.put(ResetPasswordController());

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
                        height: Get.height * 0.02,
                      ),
                      Text(
                        Strings.resetPassword.tr,
                        style: appTextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.color74BDCB,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.atLeastCharactersInLength.tr,
                            style: appTextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.008,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorRes.color74BDCB,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.itsBetterToHave.tr,
                            style: appTextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.upperLowerCase.tr,
                            style: appTextStyle(
                                color: ColorRes.greyClr,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.symbol.tr,
                            style: appTextStyle(
                                color: ColorRes.greyClr,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.aLongerPassword.tr,
                            style: appTextStyle(
                                color: ColorRes.greyClr,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Obx(
                        () => TextField(
                          controller:
                              resetPasswordController.newPasswordCon.value,
                          obscureText:
                              (resetPasswordController.isObscure.value == false)
                                  ? true
                                  : false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorRes.white,
                              contentPadding: const EdgeInsets.only(
                                top: 20,
                              ),
                              constraints: BoxConstraints.tight(
                                  Size(Get.width, Get.height * 0.07)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(99)),
                              prefixIcon:
                                  // (prefixImg == null)
                                  //     ? const SizedBox()
                                  //     :
                                  Transform.scale(
                                scale: 0.3,
                                child: Image.asset(
                                  AssetRes.passwordIcon,
                                  // height: 20,
                                  // width: 20,
                                ),
                              ),
                              suffixIcon: Obx(
                                () => InkWell(
                                  onTap: () {
                                    resetPasswordController
                                        .onTapEyeNwPassword();
                                  },
                                  child: (resetPasswordController
                                              .isObscure.value ==
                                          false)
                                      ? Transform.scale(
                                          scale: 0.2,
                                          child: Image.asset(
                                            AssetRes.closeEyeIcon,
                                          ))
                                      : const Padding(
                                          padding: EdgeInsets.only(right: 25),
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: ColorRes.greyClr,
                                            size: 20,
                                          ),
                                        ),
                                ),
                              ),
                              // : const SizedBox(),
                              hintText: Strings.newPassword.tr,
                              hintStyle: appTextStyle(
                                  fontSize: 14,
                                  color: ColorRes.greyClr,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Obx(
                        () => TextField(
                          controller:
                              resetPasswordController.reEnterPasswordCon.value,
                          obscureText:
                              (resetPasswordController.isObscureReEnter.value ==
                                      false)
                                  ? true
                                  : false,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorRes.white,
                              contentPadding: const EdgeInsets.only(
                                top: 20,
                              ),
                              constraints: BoxConstraints.tight(
                                  Size(Get.width, Get.height * 0.07)),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(99)),
                              prefixIcon:
                                  // (prefixImg == null)
                                  //     ? const SizedBox()
                                  //     :
                                  Transform.scale(
                                scale: 0.3,
                                child: Image.asset(
                                  AssetRes.passwordIcon,
                                  // height: 20,
                                  // width: 20,
                                ),
                              ),
                              suffixIcon: Obx(
                                () => InkWell(
                                  onTap: () {
                                    resetPasswordController
                                        .onTapEyeReEnterPassword();
                                  },
                                  child: (resetPasswordController
                                              .isObscureReEnter.value ==
                                          false)
                                      ? Transform.scale(
                                          scale: 0.2,
                                          child: Image.asset(
                                            AssetRes.closeEyeIcon,
                                          ))
                                      : const Padding(
                                          padding: EdgeInsets.only(right: 25),
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: ColorRes.greyClr,
                                            size: 20,
                                          ),
                                        ),
                                ),
                              ),
                              // : const SizedBox(),
                              hintText: Strings.reEnterNewPassword.tr,
                              hintStyle: appTextStyle(
                                  fontSize: 14,
                                  color: ColorRes.greyClr,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => checkbox(
                                checkBoxVal: resetPasswordController
                                    .logoutAllCheckVal.value,
                                onChanged: (val) {
                                  resetPasswordController.ontTapLogoutAllCheck(
                                      val: val ?? false);
                                }),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.logoutFromAll.tr,
                            style: appTextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => checkbox(
                                checkBoxVal: resetPasswordController
                                    .saveDeviceCheckVal.value,
                                onChanged: (val) {
                                  resetPasswordController.ontTapSaveDeviceCheck(
                                      val: val ?? false);
                                }),
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Text(
                            Strings.saveDevice.tr,
                            style: appTextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.15,
                      ),
                      button(
                          txt: Strings.confirm.tr,
                          onTap: () {
                            resetPasswordController.confirmOnTap();
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
