import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> userIdCon = TextEditingController().obs;
  Rx<TextEditingController> userPasswordCon = TextEditingController().obs;

  RxBool checkVal = false.obs;
  RxBool isObscure = false.obs;
  onTapEye() {
    if (isObscure.value == false) {
      isObscure.value = true;
    } else {
      isObscure.value = false;
    }
  }

  ontTapCheck({required bool val}) {
    checkVal.value = val;
  }

  RxString dropdownVal = "English".obs;

  var items = ["English", "German"].obs;

  onTapDropDownVal(var val) {
    dropdownVal.value = val.toString();
  }

  loginOnTap() {
    // await LoginApi.loginApi(
    //   username: userIdCon.value.text,
    //   password: userPasswordCon.value.text,
    // );

    Get.offNamedUntil(AppRes.homePage, (route) => false);
  }

  signupOnTap() {}
}
