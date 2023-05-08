import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/done_screen/done.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

class RestaurantAthenController extends GetxController {
  RxBool val = true.obs;
  RxBool cleanFloorVal = true.obs;
  RxBool dryCleanVal = true.obs;
  RxBool cleanDeskVal = true.obs;
  RxBool paperWorkVal = true.obs;
  RxBool lunchBreakVal = true.obs;
  RxBool cleaningVal = true.obs;
  RxBool plantVal = false.obs;
  RxBool windowVal = false.obs;
  RxBool filesVal = false.obs;
  RxBool roomsVal = false.obs;

  Rx<Image>? signature;

  addProblemOnTap() {
    Get.offUntil(
      MaterialPageRoute(builder: (context) => DoneScreen()),
      (route) => false,
    );
  }

  Rx<ScrollController> scrollController = ScrollController().obs;

  submitOnTap() {}

  requestForSignatureOnTap() {
    Get.toNamed(AppRes.signaturePage);
  }

  onTapCheck() {
    if (val.value == true) {
      val.value = false;
    } else {
      val.value = true;
    }
  }

  onTapFloorCheck() {
    if (cleanFloorVal.value == true) {
      cleanFloorVal.value = false;
    } else {
      cleanFloorVal.value = true;
    }
  }

  onTapDryCleanCheck() {
    if (dryCleanVal.value == true) {
      dryCleanVal.value = false;
    } else {
      dryCleanVal.value = true;
    }
  }

  onTapCleanDeskCheck() {
    if (cleanDeskVal.value == true) {
      cleanDeskVal.value = false;
    } else {
      cleanDeskVal.value = true;
    }
  }

  onTapPaperWorkCheck() {
    if (paperWorkVal.value == true) {
      paperWorkVal.value = false;
    } else {
      paperWorkVal.value = true;
    }
  }

  onTapLunchBreakCheck() {
    if (lunchBreakVal.value == true) {
      lunchBreakVal.value = false;
    } else {
      lunchBreakVal.value = true;
    }
  }

  onTapCleaningCheck() {
    if (cleaningVal.value == true) {
      cleaningVal.value = false;
    } else {
      cleaningVal.value = true;
    }
  }

  onTapPlantsCheck() {
    if (plantVal.value == true) {
      plantVal.value = false;
    } else {
      plantVal.value = true;
    }
  }

  onTapWindowCheck() {
    if (windowVal.value == true) {
      windowVal.value = false;
    } else {
      windowVal.value = true;
    }
  }

  onTapFilesCheck() {
    if (filesVal.value == true) {
      filesVal.value = false;
    } else {
      filesVal.value = true;
    }
  }

  onTapRoomsCheck() {
    if (roomsVal.value == true) {
      roomsVal.value = false;
    } else {
      roomsVal.value = true;
    }
  }
}
