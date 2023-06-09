import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/checkbox.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/common/text_field.dart';
import 'package:restaurant_athen_app/screens/login_screen/login_controller.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                halfCircle(),
                Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05, right: Get.width * 0.05),
                  child: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appBar(),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'commonAppTitle'.tr,
                                style: appTextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'commonAppSubTitle'.tr,
                                style: appTextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ColorRes.greyClr),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: Get.height * 0.065,
                                width: Get.width * 0.38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(99),
                                    color: ColorRes.white),
                                child: Obx(
                                  () => DropdownButton(
                                    // Initial Value
                                    value: loginController.dropdownVal.value,

                                    underline: Container(),
                                    // Down Arrow Icon
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: ColorRes.color74BDCB,
                                    ),

                                    // Array list of items
                                    items: loginController.items
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                AssetRes.engIcon,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.02,
                                            ),
                                            Text(items.tr),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (value) {
                                      loginController.onTapDropDownVal(value);
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.1,
                              ),
                              textfield(
                                prefixImg: AssetRes.userIcon,
                                controller: loginController.userIdCon.value,
                                hintTxt: Strings.userId.tr + " *",
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              textfield(
                                foreye: loginController.isObscure,
                                onTap: () {
                                  loginController.onTapEye();
                                },
                                prefixImg: AssetRes.passwordIcon,
                                controller:
                                    loginController.userPasswordCon.value,
                                hintTxt: Strings.userPassword.tr + " *",
                                isSuffix: true,
                                obscureTxt: true.obs,
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Row(
                                children: [
                                  Obx(
                                    () => checkbox(
                                        checkBoxVal:
                                            loginController.checkVal.value,
                                        onChanged: (val) {
                                          loginController.ontTapCheck(
                                              val: val ?? false);
                                        }),
                                  ),
                                  Text(
                                    Strings.rememberMe.tr,
                                    style: appTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRes.forgotPasswordPage);
                                    },
                                    child: Text(
                                      Strings.forgotPassword.tr + "?",
                                      style: appTextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.15,
                              ),
                              button(
                                  txt: Strings.logIn.tr,
                                  onTap: () {
                                    loginController.loginOnTap();
                                  }),
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: (Strings.donTHaveAnAccount.tr +
                                              "? "),
                                          style: appTextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: (Strings.signUp.tr),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // PrefService.setValue(PrefKeys.isLogin, true);
                                              // Get.to(() => SignupScreen());

                                              loginController.signupOnTap();
                                            },
                                          style: appTextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: ColorRes.color74BDCB),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Obx(
            () => (loginController.loader.value == true)
                ? const SmallLoader()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
