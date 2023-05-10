import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

void errorToast(String error, {String? title}) {
  Get.snackbar(
    title ?? "Error",
    error,
    //duration: const Duration(seconds: 2),
    colorText: Colors.white,
    backgroundColor: Colors.red,
  );
}

void flutterToast(String value, {String? title}) {
  Get.snackbar(
    title ?? "Success",
    value,
    //duration: const Duration(seconds: 2),
    colorText: ColorRes.white,
    backgroundColor: Colors.green,
  );
}
