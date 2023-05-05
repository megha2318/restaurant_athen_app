import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

class VerificationController extends GetxController {
  Rx<TextEditingController> verCon = TextEditingController().obs;

  continueOnTap() {
    Get.toNamed(AppRes.resetPasswordPage);
  }
}
