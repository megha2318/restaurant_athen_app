import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/done_screen/done.dart';

class ResetPasswordController extends GetxController {
  Rx<TextEditingController> newPasswordCon = TextEditingController().obs;
  Rx<TextEditingController> reEnterPasswordCon = TextEditingController().obs;

  RxBool isObscure = false.obs;
  RxBool isObscureReEnter = false.obs;
  onTapEyeNwPassword() {
    if (isObscure.value == false) {
      isObscure.value = true;
    } else {
      isObscure.value = false;
    }
  }

  onTapEyeReEnterPassword() {
    if (isObscureReEnter.value == false) {
      isObscureReEnter.value = true;
    } else {
      isObscureReEnter.value = false;
    }
  }

  RxBool logoutAllCheckVal = false.obs;

  ontTapLogoutAllCheck({required bool val}) {
    logoutAllCheckVal.value = val;
  }

  RxBool saveDeviceCheckVal = false.obs;

  ontTapSaveDeviceCheck({required bool val}) {
    saveDeviceCheckVal.value = val;
  }

  confirmOnTap() {
    Get.offUntil(
      MaterialPageRoute(
          builder: (context) => DoneScreen(
                flow: "ps",
              )),
      (route) => false,
    );
  }
}
