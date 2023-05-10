import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/screens/done_screen/done.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

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
  List<Widget> input = [];
  List<TextEditingController> textEditingController = [];

  addProblemOnTap() {
    // input.add(getInput());
    // update(['problem']);

    Get.offUntil(
      MaterialPageRoute(builder: (context) => DoneScreen()),
      (route) => false,
    );
  }

  getInput() {
    return Container(
      padding: EdgeInsets.only(
          left: Get.width * 0.05,
          right: Get.width * 0.05,
          bottom: Get.height * 0.02,
          top: Get.height * 0.02),
      width: Get.width,
      // height: Get.height * 0.48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: ColorRes.white),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(10),
            padding: EdgeInsets.all(0),
            dashPattern: [6, 3, 6, 3],
            color: Colors.grey,
            strokeWidth: 2,
            strokeCap: StrokeCap.round,
            child: Container(
              height: Get.height * 0.25,
              width: Get.width,
              decoration: BoxDecoration(
                  color: ColorRes.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AssetRes.houseImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: Get.width * 0.05),
            width: Get.width,
            height: Get.height * 0.065,
            decoration: BoxDecoration(
                color: ColorRes.backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Could not clean the window, because no windows".tr,
              style: appTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: button(fontSize: 14, txt: "Edit", onTap: () {})),
              SizedBox(
                width: Get.width * 0.05,
              ),
              Expanded(
                flex: 1,
                child: FloatingActionButton(
                  heroTag: "1st",
                  elevation: 0,
                  backgroundColor: ColorRes.backgroundColor,
                  onPressed: () {},
                  child: Transform.scale(
                    scale: 0.5,
                    child: Image.asset(AssetRes.deleteIcon),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Rx<ScrollController> scrollController = ScrollController().obs;

  submitOnTap() {
    Get.offUntil(
      MaterialPageRoute(builder: (context) => DoneScreen()),
      (route) => false,
    );
  }

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
