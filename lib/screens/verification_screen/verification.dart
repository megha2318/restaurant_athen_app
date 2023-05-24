import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/screens/verification_screen/verification_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  final VerificationController verificationController =
      Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Stack(
        children: [
          SizedBox(
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
                            Strings.enterDigitsCode.tr,
                            style: appTextStyle(
                                fontSize: 30, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            Strings.enterDigitsCodeTxt.tr + ".",
                            style: appTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorRes.greyClr),
                          ),
                          SizedBox(
                            height: Get.height * 0.1,
                          ),
                          PinCodeTextField(
                            appContext: context,

                            pastedTextStyle: const TextStyle(
                              color: ColorRes.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textStyle: appTextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                            length: 4,
                            obscureText: false,
                            // obscuringCharacter: '.',
                            // obscuringWidget: const FlutterLogo(
                            //   size: 24,
                            // ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {},
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.circle,
                                // borderRadius: BorderRadius.circular(5),

                                fieldHeight: 68,
                                fieldWidth: 68,
                                inactiveColor: ColorRes.white,
                                selectedFillColor: ColorRes.white,
                                selectedColor: ColorRes.white,
                                activeFillColor: Colors.white,
                                inactiveFillColor: ColorRes.white,
                                activeColor: ColorRes.white),
                            cursorColor: Colors.black,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            // errorAnimationController: errorController,
                            controller: verificationController.verCon.value,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              debugPrint("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              debugPrint(value);
                            },
                            beforeTextPaste: (text) {
                              debugPrint("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<VerificationController>(
                                id: "timer",
                                builder: (controller) => Text(
                                  (" ${(controller.seconds.inMinutes).toString().padLeft(2, "0")}:${(controller.seconds.inSeconds % 60).toString().padLeft(2, "0")}"),
                                  style: appTextStyle(
                                      color: ColorRes.color74BDCB,
                                      fontSize: 14),
                                ),
                              ),
                              // Text(
                              //   "00:30",
                              //   style: appTextStyle(
                              //       color: ColorRes.color74BDCB, fontSize: 14),
                              // ),
                              Spacer(),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: (Strings.notReceived.tr + "?"),
                                      style: appTextStyle(
                                        fontSize: 14,
                                        color: ColorRes.greyClr,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: (Strings.resend.tr),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ///===== resend ========///
                                          verificationController
                                              .resendOtpOnTap(args);
                                        },
                                      style: appTextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.26,
                          ),
                          button(
                              txt: Strings.continu,
                              onTap: () {
                                verificationController.continueOnTap();
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
          Obx(
            () => (verificationController.loader.value == true)
                ? const SmallLoader()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
