import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/otp_api.dart';
import 'package:restaurant_athen_app/api_calling/resend_otp_api.dart';
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/resend_otp_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';

class VerificationController extends GetxController {
  Rx<TextEditingController> verCon = TextEditingController().obs;

  String errorOtp = "";
  RxBool loader = false.obs;
  bool validator() {
    otpValidation();
    if (errorOtp == "") {
      return true;
    }
    return false;
  }

  otpValidation() {
    if (verCon.value.text == "") {
      errorOtp = "Please enter otp";
    } else {
      errorOtp = "";
    }
  }

  continueOnTap() async {
    if (validator()) {
      loader.value = true;
      await OtpApi.otpApi(
          email: PrefService.getString("email"), otp: verCon.value.text);
      loader.value = false;
    } else {
      if (errorOtp != "") {
        errorToast(errorOtp);
      }
    }
    // Get.toNamed(AppRes.resetPasswordPage);
  }

  Duration seconds = const Duration(seconds: 30);
  Timer? _countDown;

  Future startTimer() async {
    // seconds = 60;
    _countDown?.cancel();
    seconds = const Duration(seconds: 30);
    const oneSec = Duration(seconds: 1);
    _countDown = Timer.periodic(
      oneSec,
      (timer) {
        if (seconds.inSeconds == 0) {
          _countDown?.cancel();
          timer.cancel();
          update(['timer']);
        } else {
          seconds = Duration(seconds: seconds.inSeconds - 1);
          update(['timer']);
        }
      },
    );
    update(['timer']);
  }

  ResendOtpModel resendOtpModel = ResendOtpModel();
  resendOtpOnTap(String email) async {
    resendOtpModel = await ResendOtpApi.resendOtpApi(email: email);
    // flutterToast("Otp sent successfully");
    startTimer();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startTimer();
  }
}
