import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/login_api.dart';
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/login_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> userIdCon = TextEditingController().obs;
  Rx<TextEditingController> userPasswordCon = TextEditingController().obs;

  RxBool checkVal = false.obs;
  RxBool isObscure = false.obs;

  String errorId = "";
  String errorPassword = "";

  bool validator() {
    idValidator();
    passwordValidator();

    if (errorId == "" && errorPassword == "") {
      return true;
    }
    return false;
  }

  idValidator() {
    if (userIdCon.value.text == "") {
      errorId = "Please enter user id".tr;
    } else {
      errorId = "";
    }
  }

  passwordValidator() {
    if (userPasswordCon.value.text == "") {
      errorPassword = "Please enter user id".tr;
    } else {
      errorPassword = "";
    }
  }

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
    // dropdownVal.value = PrefService.getString("gr").toString();
    if (val == "German") {
      Get.updateLocale(const Locale("gr"));
      PrefService.setValue("gr", "German");
      dropdownVal.value = PrefService.getString("gr").toString();
    } else {
      Get.updateLocale(const Locale("en"));
      PrefService.setValue("gr", "English");

      dropdownVal.value = PrefService.getString("gr").toString();
    }
  }

  LoginModel loginModel = LoginModel();
  loginOnTap() async {
    if (validator()) {
      await LoginApi.loginApi(
        username: userIdCon.value.text,
        password: userPasswordCon.value.text,
      );
    } else {
      if (errorId != "") {
        errorToast(errorId);
      } else if (errorPassword != "") {
        errorToast(errorPassword);
      }
    }

    // Get.offNamedUntil(AppRes.homePage, (route) => false);
  }

  signupOnTap() {}
}
