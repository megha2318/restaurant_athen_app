import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/login_api.dart';
import 'package:restaurant_athen_app/models/login_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';

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
    await LoginApi.loginApi(
      username: userIdCon.value.text,
      password: userPasswordCon.value.text,
    );

    // Get.offNamedUntil(AppRes.homePage, (route) => false);
  }

  signupOnTap() {}
}
