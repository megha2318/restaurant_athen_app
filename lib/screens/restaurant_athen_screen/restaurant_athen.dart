import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/delete_problem_api.dart';
import 'package:restaurant_athen_app/api_calling/delete_signature_api.dart';
import 'package:restaurant_athen_app/api_calling/edit_problem_api.dart';
import 'package:restaurant_athen_app/api_calling/single_obj_api.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/common/text_field.dart';
import 'package:restaurant_athen_app/common/title_with_rounded_check.dart';
import 'package:restaurant_athen_app/screens/home_screen/home_controller.dart';
import 'package:restaurant_athen_app/screens/pdf_screen/show_pdf.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class RestaurantAthenScreen extends StatefulWidget {
  RestaurantAthenScreen({Key? key, this.signature, this.reverse})
      : super(key: key);

  String? signature;
  bool? reverse;

  @override
  State<RestaurantAthenScreen> createState() => _RestaurantAthenScreenState();
}

class _RestaurantAthenScreenState extends State<RestaurantAthenScreen> {
  final RestaurantAthenController restaurantAthenController =
      Get.put(RestaurantAthenController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  HomeController homeController = Get.put(HomeController());
  List input = [];

  @override
  Widget build(BuildContext context) {
    dynamic val = ModalRoute.of(context)!.settings.arguments;
    dynamic args = (val == null) ? [] : val[1];
    String clientName = (val == null) ? "" : val[0];

    if (widget.reverse == true) {
      setState(() {});
    }

    if (restaurantAthenController.singleObjModel.value.data != null) {
      if (restaurantAthenController.singleObjModel.value.data?.signature !=
          []) {
        // PrefService.setValue(
        //     "signatureId",
        //     restaurantAthenController
        //         .singleObjModel.value.data?.signature?[0].id);
      }

      //     .signature = widget.signature;
      // restaurantAthenController.
    }
    return Scaffold(
      key: _key,
      drawer: drawer(),
      backgroundColor: ColorRes.backgroundColor,
      body: Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: Get.height * 0.07,
              ),
              // padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
              // height: Get.height * 0.15,
              width: Get.width,
              // color: ColorRes.black,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  FloatingActionButton(
                    backgroundColor: ColorRes.white,
                    elevation: 0,
                    heroTag: 'equal',
                    mini: true,
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Transform.scale(
                      scale: 0.3,
                      child: Image.asset(AssetRes.equalIcon),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(
                          height: 60,
                          child: Image.asset(
                            AssetRes.logoImg,
                            fit: BoxFit.fitHeight,
                          )),
                      SizedBox(
                        height: Get.height * 0.008,
                      ),
                      Text(
                        clientName,
                        style: appTextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: ColorRes.white,
                    elevation: 0,
                    heroTag: "not",
                    mini: true,
                    child: Transform.scale(
                      scale: 0.4,
                      child: Image.asset(AssetRes.notificationIcon),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // appBarHome(title: "Restaurant Athen", context: context),
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
                          bottom: Get.height * 0.02,
                          top: Get.height * 0.02),
                      width: Get.width,
                      // height: Get.height * 0.43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Today Work Details".tr,
                                style: appTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          titleWithTextField(
                              enabled: false,
                              title: Strings.workAddress,
                              hintTxt: args.address,
                              suffixImg: AssetRes.locationIcon),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: titleWithTextField(
                                    enabled: false,
                                    title: Strings.hours,
                                    hintTxt: args.hours,
                                    suffixImg: AssetRes.clockIcon),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: titleWithTextField(
                                    enabled: false,
                                    title: Strings.minutes,
                                    hintTxt: args.minutes,
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
                                  hintTxt: args.contactPersonName,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Expanded(
                                flex: 1,
                                child: titleWithTextFieldWithoutSuffix(
                                  title: Strings.contactNumber,
                                  hintTxt: args.contactPersonPhoneNumber,
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
                      // height: Get.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorRes.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "timeRecording".tr,
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
                                        "${args.startTime}",
                                        style: appTextStyle(
                                            fontSize: 20,
                                            color: ColorRes.color74BDCB),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      Text(
                                        Strings.starttime.tr,
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
                                        "${args.endTime.toString().split('-')[0]}:${args.endTime.toString().split('-')[1]}",
                                        style: appTextStyle(
                                            fontSize: 20,
                                            color: ColorRes.color74BDCB),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.005,
                                      ),
                                      Text(
                                        Strings.endtime.tr,
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
                    Obx(
                      () => (restaurantAthenController
                                  .singleObjModel.value.data !=
                              null)
                          ? Container(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.05,
                                  right: Get.width * 0.05,
                                  top: Get.height * 0.02,
                                  bottom: Get.height * 0.02),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorRes.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "myTodayTask".tr,
                                    style: appTextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Column(
                                    children: [
                                      ...List.generate(
                                          (restaurantAthenController
                                                      .singleObjModel
                                                      .value
                                                      .data !=
                                                  null)
                                              ? restaurantAthenController
                                                      .singleObjModel
                                                      .value
                                                      .data
                                                      ?.tasks
                                                      ?.length ??
                                                  0
                                              : 0, (index) {
                                        List stsdrpdwn = List.generate(
                                            restaurantAthenController
                                                    .singleObjModel
                                                    .value
                                                    .data
                                                    ?.tasks
                                                    ?.length ??
                                                0,
                                            (index) => restaurantAthenController
                                                        .singleObjModel
                                                        .value
                                                        .data
                                                        ?.tasks?[index]
                                                        .status ==
                                                    "0"
                                                ? "Pending"
                                                : restaurantAthenController
                                                            .singleObjModel
                                                            .value
                                                            .data
                                                            ?.tasks?[index]
                                                            .status ==
                                                        "1"
                                                    ? "InProgress"
                                                    : "Complete");
                                        return titleWithRoundedCheck(
                                            id: restaurantAthenController
                                                .singleObjModel
                                                .value
                                                .data
                                                ?.tasks?[index]
                                                .id,
                                            empName: restaurantAthenController
                                                .singleObjModel
                                                .value
                                                .data
                                                ?.tasks?[index]
                                                .employee?[0]
                                                .firstName
                                                .toString(),
                                            dropdownVal: stsdrpdwn[index],
                                            items: (stsdrpdwn[index] ==
                                                    "InProgress")
                                                ? ['Complete']
                                                : ['InProgress', "Complete"],
                                            title:
                                                "${restaurantAthenController.singleObjModel.value.data?.tasks?[index].name}"
                                            // "${homeController.taskListModel.value.data?[index].name}"
                                            );
                                      })
                                    ],
                                  )
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Obx(
                      () => (restaurantAthenController
                                  .singleObjModel.value.data ==
                              null)
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.05,
                                  right: Get.width * 0.05,
                                  bottom: Get.height * 0.02,
                                  top: Get.height * 0.02),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: ColorRes.white),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        Strings.mainTaskList.tr,
                                        style: appTextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  ...List.generate(
                                      restaurantAthenController.singleObjModel
                                          .value.data!.pdfs!.length, (index) {
                                    restaurantAthenController.pdfTOImg(
                                        restaurantAthenController.singleObjModel
                                            .value.data!.pdfs![index].pdf);
                                    return (index < 2)
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: Get.height * 0.03),
                                                alignment: Alignment.center,
                                                height: Get.height * 0.36,
                                                decoration: BoxDecoration(
                                                    color: ColorRes
                                                        .backgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: GetBuilder<
                                                    RestaurantAthenController>(
                                                  id: 'pdf',
                                                  builder: (restaurantAthenController) =>
                                                      (restaurantAthenController
                                                                  .pageImage ==
                                                              null)
                                                          ? const SizedBox()
                                                          : Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.36,
                                                                  width:
                                                                      Get.width *
                                                                          0.5,
                                                                  child:
                                                                      PDFViewer(
                                                                    document: restaurantAthenController
                                                                            .document?[index] ??
                                                                        PDFDocument(),
                                                                    progressIndicator:
                                                                        const SmallLoader(),
                                                                    lazyLoad:
                                                                        false,
                                                                    isOnePage:
                                                                        true,
                                                                    showIndicator:
                                                                        false,
                                                                    zoomSteps:
                                                                        0,
                                                                    showNavigation:
                                                                        false,
                                                                    showPicker:
                                                                        false,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableSwipeNavigation:
                                                                        false,
                                                                    controller:
                                                                        PageController(
                                                                      initialPage:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height:
                                                                      Get.height *
                                                                          0.36,
                                                                  width:
                                                                      Get.width *
                                                                          0.5,
                                                                  color: ColorRes
                                                                      .color74BDCB
                                                                      .withOpacity(
                                                                          0.01),
                                                                ),
                                                              ],
                                                            ),
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
                                                        onTap: () async {
                                                          bool isSave = await restaurantAthenController.pdfDownload(
                                                              restaurantAthenController
                                                                  .singleObjModel
                                                                  .value
                                                                  .data!
                                                                  .pdfs![index]
                                                                  .pdf
                                                                  .toString(),
                                                              'mainTask${restaurantAthenController.singleObjModel.value.data!.pdfs![index].id}.pdf');
                                                          if (isSave) {
                                                            flutterToast(
                                                                'PDF download Successfully');
                                                          }
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: Get.height *
                                                              0.065,
                                                          width: Get.width,
                                                          // margin: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                                                          decoration: BoxDecoration(
                                                              color: ColorRes
                                                                  .color74BDCB,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          99)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  height: 14,
                                                                  width: 14,
                                                                  child: Image
                                                                      .asset(
                                                                    AssetRes
                                                                        .downloadIcon,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  )),
                                                              SizedBox(
                                                                width:
                                                                    Get.width *
                                                                        0.008,
                                                              ),
                                                              Text(
                                                                Strings.download
                                                                    .tr,
                                                                style:
                                                                    appTextStyle(
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
                                                      backgroundColor: ColorRes
                                                          .backgroundColor,
                                                      onPressed: () {
                                                        Get.to(() => ShowPDF(
                                                              pdfDocument:
                                                                  restaurantAthenController
                                                                          .document?[
                                                                      index],
                                                            ));
                                                      },
                                                      child: const Icon(
                                                        Icons
                                                            .visibility_rounded,
                                                        color: ColorRes
                                                            .color74BDCB,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : SizedBox();
                                  })
                                ],
                              ),
                            ),
                    ),
                    // SizedBox(
                    //   height: Get.height * 0.04,
                    // ),
                    // restaurantAthenController.getInput(),

                    Obx(
                      () => (restaurantAthenController
                                  .singleObjModel.value.data !=
                              null)
                          ? Column(
                              children: [
                                ...List.generate(
                                    restaurantAthenController.singleObjModel
                                        .value.data!.problems!.length, (index) {
                                  restaurantAthenController
                                          .textEditingController[index].text =
                                      restaurantAthenController.singleObjModel
                                          .value.data!.problems![index].reason
                                          .toString();
                                  return Container(
                                    margin:
                                        EdgeInsets.only(top: Get.height * 0.04),
                                    padding: EdgeInsets.only(
                                        left: Get.width * 0.05,
                                        right: Get.width * 0.05,
                                        bottom: Get.height * 0.02,
                                        top: Get.height * 0.02),
                                    width: Get.width,
                                    // height: Get.height * 0.48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorRes.white),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              elevation: 10,
                                              barrierColor: ColorRes.black
                                                  .withOpacity(0.4),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  ColorRes.color74BDCB,
                                              context: context,
                                              builder: (context) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final path =
                                                            await restaurantAthenController
                                                                .gallaryPickImage();
                                                        if (path != null) {
                                                          restaurantAthenController
                                                                  .updatedImgList[
                                                              index] = path;
                                                          restaurantAthenController
                                                              .update([
                                                            'imgUpdateAPI'
                                                          ]);
                                                          // img = io.File(path);
                                                          // addImg(img: path);
                                                          // restaurantAthenController.imageUrl[index] =
                                                          //     img;
                                                          // print(path);
                                                        }
                                                        Get.back();
                                                      },
                                                      child: ListTile(
                                                        leading: const Icon(
                                                            Icons.camera,
                                                            color:
                                                                ColorRes.white),
                                                        title: Text(
                                                          "Camera".tr,
                                                          style: appTextStyle(
                                                              fontSize: 16,
                                                              color: ColorRes
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 0.3,
                                                      width: Get.width,
                                                      color: ColorRes.white,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        final path =
                                                            await restaurantAthenController
                                                                .gallaryPickImage();
                                                        if (path != null) {
                                                          restaurantAthenController
                                                                  .updatedImgList[
                                                              index] = path;
                                                          restaurantAthenController
                                                              .update([
                                                            'imgUpdateAPI'
                                                          ]);
                                                          print(
                                                              "========================================================================");
                                                          print(restaurantAthenController
                                                                  .updatedImgList[
                                                              index]);
                                                          print(
                                                              "========================================================================");
                                                        }
                                                        Get.back();
                                                      },
                                                      child: ListTile(
                                                        leading: const Icon(
                                                          Icons
                                                              .photo_size_select_actual_outlined,
                                                          color: ColorRes.white,
                                                        ),
                                                        title: Text(
                                                          "Gallery".tr,
                                                          style: appTextStyle(
                                                              fontSize: 16,
                                                              color: ColorRes
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: DottedBorder(
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
                                                  color:
                                                      ColorRes.backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: GetBuilder<
                                                    RestaurantAthenController>(
                                                  id: 'imgUpdateAPI',
                                                  builder: (restaurantAthenController) =>
                                                      (restaurantAthenController
                                                                      .updatedImgList[
                                                                  index] !=
                                                              "")
                                                          ? Image.file(
                                                              File(restaurantAthenController
                                                                      .updatedImgList[
                                                                  index]),
                                                              fit: BoxFit.cover,
                                                            )
                                                          : CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl: restaurantAthenController
                                                                  .singleObjModel
                                                                  .value
                                                                  .data!
                                                                  .problems![
                                                                      index]
                                                                  .image
                                                                  .toString(),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  SmallLoader(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Image.asset(
                                                                      AssetRes
                                                                          .logoImg),
                                                            ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.only(
                                                left: Get.width * 0.05),
                                            width: Get.width,
                                            height: Get.height * 0.065,
                                            decoration: BoxDecoration(
                                                color: ColorRes.backgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: TextField(
                                              controller:
                                                  restaurantAthenController
                                                          .textEditingController[
                                                      index],
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              // expands: true,
                                              // maxLines: 1,
                                              // minLines: 1,

                                              style: appTextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                              minLines: 1,
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor:
                                                      ColorRes.backgroundColor,
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  // constraints:
                                                  //     BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  hintMaxLines: 2,
                                                  hintText:
                                                      "Enter your problem reason here"
                                                          .toString()
                                                          .tr,
                                                  hintStyle: appTextStyle(
                                                      fontSize: 12,
                                                      color: ColorRes.greyClr,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                            )),
                                        SizedBox(
                                          height: Get.height * 0.02,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 5,
                                                child: button(
                                                    fontSize: 14,
                                                    txt:
                                                        "editProblemPicture".tr,
                                                    onTap: () async {
                                                      restaurantAthenController.editProblemModel = await EditProblemApi.editProblemApi(
                                                          reason: restaurantAthenController
                                                              .textEditingController[
                                                                  index]
                                                              .value
                                                              .text
                                                              .toString(),
                                                          image: (restaurantAthenController
                                                                      .updatedImgList[
                                                                          index]
                                                                      .toString() ==
                                                                  "")
                                                              ? restaurantAthenController
                                                                  .singleObjModel
                                                                  .value
                                                                  .data!
                                                                  .problems![
                                                                      index]
                                                                  .image
                                                                  .toString()
                                                              : restaurantAthenController
                                                                  .updatedImgList[
                                                                      index]
                                                                  .toString());
                                                      setState(() {});
                                                    })),
                                            SizedBox(
                                              width: Get.width * 0.05,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: FloatingActionButton(
                                                heroTag: "1st",
                                                elevation: 0,
                                                backgroundColor:
                                                    ColorRes.backgroundColor,
                                                onPressed: () async {
                                                  await DeleteProblemApi
                                                      .deleteProblemApi(
                                                    id: restaurantAthenController
                                                        .singleObjModel
                                                        .value
                                                        .data
                                                        ?.problems?[index]
                                                        .id,
                                                  );

                                                  restaurantAthenController
                                                          .singleObjModel
                                                          .value =
                                                      await SingleObjApi
                                                          .singleObjApi();
                                                  setState(() {});
                                                },
                                                child: Transform.scale(
                                                  scale: 0.5,
                                                  child: Image.asset(
                                                      AssetRes.deleteIcon),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                })
                              ],
                            )
                          : SizedBox(),
                    ),

                    GetBuilder<RestaurantAthenController>(
                        id: "problem",
                        builder: (restaurantAthenController) => Column(
                              children: [
                                ...restaurantAthenController.input
                                    .map((e) => e),
                              ],
                            )),

                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Get.width * 0.05,
                          right: Get.width * 0.05,
                          bottom: Get.height * 0.02,
                          top: Get.height * 0.02),
                      width: Get.width,
                      // height: (widget.signature != null)
                      //     ? Get.height * 0.68
                      //     : Get.height * 0.2,
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
                                  text: (Strings.requestForSignature.tr),
                                  style: appTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: (Strings.optional.tr),
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
                            Strings.signatureTxt.tr,
                            style: appTextStyle(
                                color: ColorRes.greyClr,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(
                            () => (restaurantAthenController
                                            .singleObjModel.value.data !=
                                        null &&
                                    (restaurantAthenController.singleObjModel
                                        .value.data!.signature!.isNotEmpty))
                                ? Container(
                                    width: Get.width,
                                    height: Get.height * 0.45,
                                    decoration: BoxDecoration(
                                        color: ColorRes.backgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: (widget.signature != null)
                                        ? Image.file(File(widget.signature!))
                                        : Image.file(File(
                                            restaurantAthenController
                                                .singleObjModel
                                                .value
                                                .data!
                                                .signature![0]
                                                .signature
                                                .toString())),

                                    // CachedNetworkImage(
                                    //   imageUrl: restaurantAthenController
                                    //       .singleObjModel
                                    //       .value
                                    //       .data!
                                    //       .signature![0]
                                    //       .signature
                                    //       .toString(),
                                    //   placeholder: (context, url) =>
                                    //       SmallLoader(),
                                    //   // errorWidget: (context, url, error) =>
                                    //   //     Image.asset(AssetRes.logoImg),
                                    // ),
                                    // widget.signature,
                                  )
                                : SizedBox(),
                          ),
                          Obx(
                            () => (restaurantAthenController
                                            .singleObjModel.value.data !=
                                        null &&
                                    restaurantAthenController.singleObjModel
                                        .value.data!.signature!.isNotEmpty)
                                ? SizedBox(
                                    height: Get.height * 0.02,
                                  )
                                : SizedBox(),
                          ),
                          Obx(
                            () => (restaurantAthenController
                                            .singleObjModel.value.data !=
                                        null &&
                                    restaurantAthenController.singleObjModel
                                        .value.data!.signature!.isNotEmpty)
                                ? Row(
                                    children: [
                                      Expanded(
                                          flex: 5,
                                          child: button(
                                              fontSize: 14,
                                              txt: "Edit",
                                              onTap: () {
                                                restaurantAthenController
                                                    .editSignatureOnTap(
                                                        args: args,
                                                        clientName: clientName);
                                              })),
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
                                          onPressed: () async {
                                            await DeleteSignatureApi
                                                .deleteSignatureApi();
                                            widget.signature = null;
                                            await restaurantAthenController
                                                .singleObjApiCall();
                                            setState(() {});
                                          },
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                                AssetRes.deleteIcon),
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
                                          .requestForSignatureOnTap(
                                              args: args,
                                              clientName: clientName);
                                    }),
                          ),
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
                                restaurantAthenController.textEditingController
                                    .add(TextEditingController());
                                restaurantAthenController.input.add(
                                    restaurantAthenController.getInput(
                                        input.length,
                                        context,
                                        restaurantAthenController
                                            .textEditingController));
                                restaurantAthenController.update(['problem']);
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
                              txt: "submitBtn".tr,
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
