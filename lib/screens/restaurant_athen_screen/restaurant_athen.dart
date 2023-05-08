import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/text_field.dart';
import 'package:restaurant_athen_app/common/title_with_rounded_check.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class RestaurantAthenScreen extends StatefulWidget {
  RestaurantAthenScreen({Key? key, this.signature, this.reverse})
      : super(key: key);

  Image? signature;
  bool? reverse;

  @override
  State<RestaurantAthenScreen> createState() => _RestaurantAthenScreenState();
}

class _RestaurantAthenScreenState extends State<RestaurantAthenScreen> {
  final RestaurantAthenController restaurantAthenController =
      Get.put(RestaurantAthenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: Column(
          children: [
            appBarHome(title: "Restaurant Athen"),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Expanded(
              child: SingleChildScrollView(
                // controller: restaurantAthenController.scrollController.value,
                reverse: (widget.reverse == true) ? true : false,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02),
                      width: Get.width,
                      height: Get.height * 0.43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Today Work Details",
                                style: appTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          titleWithTextField(
                              title: Strings.workAddress,
                              hintTxt: Strings.enterWorkAddress,
                              suffixImg: AssetRes.locationIcon),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: titleWithTextField(
                                    title: Strings.hours,
                                    hintTxt: Strings.enterHours,
                                    suffixImg: AssetRes.clockIcon),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: titleWithTextField(
                                    title: Strings.minutes,
                                    hintTxt: Strings.enterMinutes,
                                    suffixImg: AssetRes.clockIcon),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: titleWithTextFieldWithoutSuffix(
                                  title: Strings.contactPerson,
                                  hintTxt: Strings.enterContactPerson,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: titleWithTextFieldWithoutSuffix(
                                  title: Strings.contactNumber,
                                  hintTxt: Strings.enterContactNumber,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02,
                          bottom: Get.height * 0.02),
                      width: Get.width,
                      height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Timerecording",
                            style: appTextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: Get.height * 0.11,
                                  decoration: BoxDecoration(
                                      color: ColorRes.backgroundColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "08:00",
                                        style: appTextStyle(
                                            fontSize: 20,
                                            color: ColorRes.color74BDCB),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      Text(
                                        Strings.starttime,
                                        style: appTextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: Get.height * 0.11,
                                  decoration: BoxDecoration(
                                      color: ColorRes.backgroundColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        "13:00",
                                        style: appTextStyle(
                                            fontSize: 20,
                                            color: ColorRes.color74BDCB),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      Text(
                                        Strings.endtime,
                                        style: appTextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02),
                      width: Get.width,
                      height: Get.height * 0.9999,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Task for Today",
                            style: appTextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.cleanTheWindows,
                              val: restaurantAthenController.val.value,
                              onTap: () {
                                restaurantAthenController.onTapCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.cleanTheFloor,
                              val:
                                  restaurantAthenController.cleanFloorVal.value,
                              onTap: () {
                                restaurantAthenController.onTapFloorCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.dryCleanSheets,
                              val: restaurantAthenController.dryCleanVal.value,
                              onTap: () {
                                restaurantAthenController.onTapDryCleanCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.cleanDesk,
                              val: restaurantAthenController.cleanDeskVal.value,
                              onTap: () {
                                restaurantAthenController.onTapCleanDeskCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.paperWork,
                              val: restaurantAthenController.paperWorkVal.value,
                              onTap: () {
                                restaurantAthenController.onTapPaperWorkCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.lunchBreak,
                              val:
                                  restaurantAthenController.lunchBreakVal.value,
                              onTap: () {
                                restaurantAthenController
                                    .onTapLunchBreakCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.cleaningEntrance,
                              val: restaurantAthenController.cleaningVal.value,
                              onTap: () {
                                restaurantAthenController.onTapCleaningCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.wateringAllPlants,
                              val: restaurantAthenController.plantVal.value,
                              onTap: () {
                                restaurantAthenController.onTapPlantsCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.cleanAllWindows,
                              val: restaurantAthenController.windowVal.value,
                              onTap: () {
                                restaurantAthenController.onTapWindowCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.arrangeAllFiles,
                              val: restaurantAthenController.filesVal.value,
                              onTap: () {
                                restaurantAthenController.onTapFilesCheck();
                              })),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(() => titleWithRoundedCheck(
                              title: Strings.lightsOffAllRooms,
                              val: restaurantAthenController.roomsVal.value,
                              onTap: () {
                                restaurantAthenController.onTapRoomsCheck();
                              })),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02),
                      width: Get.width,
                      height: Get.height * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                Strings.mainTaskList,
                                style: appTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Container(
                            height: Get.height * 0.36,
                            decoration: BoxDecoration(
                                color: ColorRes.backgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              AssetRes.pdfImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: Get.height * 0.065,
                                      width: Get.width,
                                      // margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                                      decoration: BoxDecoration(
                                          color: ColorRes.color74BDCB,
                                          borderRadius:
                                              BorderRadius.circular(99)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 14,
                                              width: 14,
                                              child: Image.asset(
                                                AssetRes.downloadIcon,
                                                fit: BoxFit.fitHeight,
                                              )),
                                          SizedBox(
                                            width: Get.width * 0.008,
                                          ),
                                          Text(
                                            Strings.download,
                                            style: appTextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: FloatingActionButton(
                                  heroTag: "eye",
                                  elevation: 0,
                                  backgroundColor: ColorRes.backgroundColor,
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.visibility_rounded,
                                    color: ColorRes.color74BDCB,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02),
                      width: Get.width,
                      height: Get.height * 0.48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
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
                              "Could not clean the window, because no windows",
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
                                  child: button(
                                      fontSize: 14, txt: "Edit", onTap: () {})),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: FloatingActionButton(
                                  heroTag: "1st",
                                  elevation: 0,
                                  backgroundColor: ColorRes.backgroundColor,
                                  onPressed: () {
                                    widget.signature = null;
                                    setState(() {});
                                  },
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
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          top: Get.height * 0.02),
                      width: Get.width,
                      height: (widget.signature != null)
                          ? Get.height * 0.68
                          : Get.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: (Strings.requestForSignature),
                                  style: appTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: (Strings.optional),
                                  style: appTextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: ColorRes.color74BDCB),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          Text(
                            Strings.signatureTxt,
                            style: appTextStyle(
                                color: ColorRes.greyClr,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          (widget.signature != null)
                              ? Container(
                                  width: Get.width,
                                  height: Get.height * 0.45,
                                  decoration: BoxDecoration(
                                      color: ColorRes.backgroundColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: widget.signature,
                                )
                              : SizedBox(),
                          (widget.signature != null)
                              ? SizedBox(
                                  height: Get.height * 0.02,
                                )
                              : SizedBox(),
                          (widget.signature != null)
                              ? Row(
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: button(
                                            fontSize: 14,
                                            txt: "Edit",
                                            onTap: () {})),
                                    SizedBox(
                                      width: Get.width * 0.05,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FloatingActionButton(
                                        heroTag: "delete",
                                        elevation: 0,
                                        backgroundColor:
                                            ColorRes.backgroundColor,
                                        onPressed: () {
                                          widget.signature = null;
                                          setState(() {});
                                        },
                                        child: Transform.scale(
                                          scale: 0.5,
                                          child:
                                              Image.asset(AssetRes.deleteIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : button(
                                  fontSize: 14,
                                  txt: "Add Signature",
                                  onTap: () {
                                    restaurantAthenController
                                        .requestForSignatureOnTap();
                                  }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: button(
                              fontSize: 14,
                              txt: "Add Problem",
                              onTap: () {
                                restaurantAthenController.addProblemOnTap();
                              }),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Expanded(
                          flex: 1,
                          child: button(
                              fontSize: 14,
                              color: ColorRes.white,
                              txt: "Submit",
                              onTap: () {
                                restaurantAthenController.submitOnTap();
                              }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
