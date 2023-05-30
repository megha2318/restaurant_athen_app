import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/login_screen/login_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

final LoginController loginController = Get.put(LoginController());

Widget textfield({
  String? prefixImg,
  bool? isSuffix,
  String? hintTxt,
  RxBool? obscureTxt,
  RxBool? foreye,
  TextInputType? keyboardType,
  void Function()? onTap,
  void Function()? onTapTextField,
  bool? isOnTapTxtFld,
  required TextEditingController controller,
}) {
  return Container(
    alignment: Alignment.center,
    height: Get.height * 0.07,
    width: Get.width,
    child: (obscureTxt?.value == null)
        ? TextField(
            onTap: onTapTextField,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: (obscureTxt?.value == null)
                ? false
                : (loginController.isObscure.value == false)
                    ? true
                    : false,
            textAlignVertical: TextAlignVertical.center,
            // expands: true,
            // maxLines: 1,
            // minLines: 1,

            style: appTextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            maxLines: 2,
            minLines: 1,
            decoration: InputDecoration(
                filled: true,
                enabled: (isOnTapTxtFld == true) ? false : true,
                fillColor: ColorRes.white,
                contentPadding: const EdgeInsets.all(0),
                // constraints:
                //     BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
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
                    prefixImg!,
                  ),
                ),
                suffixIcon: (isSuffix == true)
                    ? Obx(
                        () => InkWell(
                          onTap: () {
                            loginController.onTapEye();
                          },
                          child: (loginController.isObscure.value == false)
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
                      )
                    : const SizedBox(),
                hintMaxLines: 2,
                hintText: hintTxt.toString().tr,
                hintStyle: appTextStyle(
                    fontSize: 14,
                    color: ColorRes.greyClr,
                    fontWeight: FontWeight.w400)),
          )
        : Obx(
            () => TextField(
              controller: controller,
              obscureText: (obscureTxt?.value == true)
                  ? (foreye?.value == false)
                      ? true
                      : false
                  : false,
              style: appTextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              textAlignVertical: TextAlignVertical.center,
              minLines: 1,
              // maxLines: 2,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorRes.white,
                  contentPadding: const EdgeInsets.all(0),
                  constraints:
                      BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
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
                      prefixImg!,
                    ),
                  ),
                  suffixIcon: (isSuffix == true)
                      ? Obx(
                          () => InkWell(
                            onTap: onTap,
                            child: (foreye?.value == false)
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
                        )
                      : const SizedBox(),
                  hintText: hintTxt.toString().tr,
                  hintStyle: appTextStyle(
                      fontSize: 14,
                      color: ColorRes.greyClr,
                      fontWeight: FontWeight.w400)),
            ),
          ),
  );
}

Widget textFieldWithoutSuffix({
  String? prefixImg,
  bool? isSuffix,
  String? hintTxt,
  double? hintFontSize,
  RxBool? obscureTxt,
  RxBool? foreye,
  TextInputType? keyboardType,
  void Function()? onTap,
  void Function()? onTapTextField,
  bool? isOnTapTxtFld,
  required TextEditingController controller,
}) {
  return Container(
    alignment: Alignment.center,
    height: Get.height * 0.07,
    width: Get.width,
    child: (obscureTxt?.value == null)
        ? TextField(
            onTap: onTapTextField,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: (obscureTxt?.value == null)
                ? false
                : (loginController.isObscure.value == false)
                    ? true
                    : false,
            maxLines: 2,
            minLines: 1,
            decoration: InputDecoration(
                filled: true,
                enabled: (isOnTapTxtFld == true) ? false : true,
                fillColor: ColorRes.white,
                contentPadding: const EdgeInsets.all(0),
                // constraints:
                //     BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
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
                    prefixImg!,
                  ),
                ),
                hintText: hintTxt.toString().tr,
                hintMaxLines: 2,
                hintStyle: appTextStyle(
                    fontSize: hintFontSize ?? 12,
                    color: ColorRes.greyClr,
                    fontWeight: FontWeight.w400)),
          )
        : Obx(
            () => TextField(
              controller: controller,
              obscureText: (obscureTxt?.value == null)
                  ? false
                  : (foreye?.value == false)
                      ? true
                      : false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorRes.white,
                  contentPadding: const EdgeInsets.only(
                    top: 20,
                  ),
                  constraints:
                      BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
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
                      prefixImg!,
                    ),
                  ),
                  suffixIcon: (isSuffix == true)
                      ? Obx(
                          () => InkWell(
                            onTap: onTap,
                            child: (foreye?.value == false)
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
                        )
                      : const SizedBox(),
                  hintText: hintTxt.toString().tr,
                  hintStyle: appTextStyle(
                      fontSize: 14,
                      color: ColorRes.greyClr,
                      fontWeight: FontWeight.w400)),
            ),
          ),
  );
}

Widget titleWithTextField({
  String? title,
  String? suffixImg,
  String? hintTxt,
  bool? enabled,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title.toString().tr,
        style: appTextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: Get.height * 0.01,
      ),
      SizedBox(
        height: Get.height * 0.065,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          style: appTextStyle(fontSize: 11, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            enabled: enabled ?? true,
            filled: true,
            fillColor: ColorRes.backgroundColor,
            contentPadding: const EdgeInsets.only(
              left: 15,
              right: 0,
            ),
            // constraints:
            //     BoxConstraints.tight(Size(Get.width, Get.height * 0.065)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)),
            hintMaxLines: 2,

            suffixIcon: (suffixImg == null)
                ? const SizedBox()
                : Transform.scale(
                    scale: 0.3,
                    child: Image.asset(
                      suffixImg,
                    )),
            hintText: hintTxt.toString().tr,
            hintStyle: appTextStyle(
                color: ColorRes.greyClr,
                fontSize: 11,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}

Widget titleWithTextFieldWithoutSuffix({
  String? title,
  String? suffixImg,
  String? hintTxt,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title.toString().tr,
        style: appTextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: Get.height * 0.01,
      ),
      Container(
        height: Get.height * 0.065,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorRes.backgroundColor,
            contentPadding: const EdgeInsets.only(left: 15, right: 0),
            // constraints:
            //     BoxConstraints.tight(Size(Get.width, Get.height * 0.065)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5)),
            hintMaxLines: 2,

            hintText: hintTxt.toString().tr,
            hintStyle: appTextStyle(
                color: ColorRes.greyClr,
                fontSize: 10,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    ],
  );
}
