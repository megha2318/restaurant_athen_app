import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/forgot_password_api.dart';
import 'package:restaurant_athen_app/common/popup.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> emailIdCon = TextEditingController().obs;

  String errorEmail = "";

  validator() {
    emailValidation();
    if (errorEmail == "") {
      return true;
    }
    return false;
  }

  emailValidation() {
    if (emailIdCon.value.text == "") {
      errorEmail = "Please enter email id".tr;
    } else {
      errorEmail = "";
    }
  }

  sendOnTap() async {
    if (validator()) {
      await ForgotPasswordApi.forgotPasswordApi(email: emailIdCon.value.text);
    } else {
      if (errorEmail != "") {
        errorToast(errorEmail);
      }
    }
    // Get.toNamed(AppRes.verificationPage);
  }
}
