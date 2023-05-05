import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'color_res.dart';

void handleException(exception) {
  debugPrint("EXCEPTION :: $exception");
  if (exception is PlatformException) {
    if (exception.code == "network_error") {
      Get.snackbar(
        "Failed",
        "Please check your internet connection",
        duration: const Duration(seconds: 5),
        // backgroundColor: ColorRes.colorF44336,
        colorText: ColorRes.white,
        icon: const Icon(
          Icons.cancel,
          color: ColorRes.white,
          size: 32,
        ),
      );
    } else {
      Get.snackbar(
        "Failed",
        exception.message!,
        duration: const Duration(seconds: 5),
        // backgroundColor: ColorRes.colorF44336,
        colorText: ColorRes.white,
        icon: const Icon(
          Icons.cancel,
          color: ColorRes.white,
          size: 32,
        ),
      );
    }
  } else {
    Get.snackbar(
      "Failed",
      exception.toString(),
      duration: const Duration(seconds: 5),
      // backgroundColor: ColorRes.colorF44336,
      colorText: ColorRes.white,
      icon: const Icon(
        Icons.cancel,
        color: ColorRes.white,
        size: 32,
      ),
    );
  }
}
