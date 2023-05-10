import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/reset_password_api.dart';
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';

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

  String errorPassword = "";
  String errorReEnterPassword = "";

  bool validator() {
    passwordValidation();
    reEnterPasswordValidation();
    if (errorPassword == "" && errorReEnterPassword == "") {
      return true;
    }
    return false;
  }

  passwordValidation() {
    if (newPasswordCon.value.text == "") {
      errorPassword = "Please enter new password".tr;
    } else {
      errorPassword = "";
    }
  }

  reEnterPasswordValidation() {
    if (reEnterPasswordCon.value.text == "") {
      errorReEnterPassword = "Please re-enter new password".tr;
    } else {
      errorReEnterPassword = "";
    }
  }

  confirmOnTap() async {
    if (validator()) {
      await ResetPasswordApi.resetPasswordApi(
          email: PrefService.getString("email"),
          password: newPasswordCon.value.text,
          confirmPassword: reEnterPasswordCon.value.text);
    } else {
      if (errorPassword != "") {
        errorToast(errorPassword);
      } else if (errorReEnterPassword != "") {
        errorToast(errorReEnterPassword);
      }
    }
    // Get.offUntil(
    //   MaterialPageRoute(
    //       builder: (context) => DoneScreen(
    //             flow: "ps",
    //           )),
    //   (route) => false,
    // );
  }
}
