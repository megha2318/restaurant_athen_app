import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> emailIdCon = TextEditingController().obs;

  sendOnTap() {
    Get.toNamed(AppRes.verificationPage);
  }
}
