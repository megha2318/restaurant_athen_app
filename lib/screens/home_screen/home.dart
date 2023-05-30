import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:restaurant_athen_app/api_calling/dashboard_obj_api.dart';
import 'package:restaurant_athen_app/api_calling/single_obj_api.dart';
import 'package:restaurant_athen_app/api_calling/task_list_api.dart';
import 'package:restaurant_athen_app/api_calling/work_list_api.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/screens/home_screen/home_controller.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List input = [];
  List<TextEditingController> textEditingController = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    input = (args == null) ? [] : args[0];
    textEditingController = (args == null) ? [] : args[1];

    return Scaffold(
      key: _key,
      drawer: drawer(),
      // resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.05, right: Get.width * 0.05),
                child: Column(
                  children: [
                    ////======================= app bar ===============================================
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
                                "Deine Einsätze",
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
                    // appBarHome(title: 'Deine Einsätze', context: context),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${homeController.month.value.tr}, ${homeController.getDate.value}',
                                      style: appTextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    (homeController
                                                .dashboardObjModel.value.data ==
                                            null)
                                        ? const SizedBox()
                                        : Text(
                                            '${homeController.dashboardObjModel.value.data!.length} Objects today'
                                                .tr,
                                            style: appTextStyle(
                                              fontSize: 14,
                                              color: ColorRes.color74BDCB,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              // Spacer(),
                              InkWell(
                                onTap: () async {
                                  final selected = await showMonthPicker(
                                    firstDate: DateTime(2019),
                                    lastDate: DateTime(2029),
                                    context: context,
                                    initialDate: DateTime.now(),
                                  );
                                  // final selected = await showMonthYearPicker(
                                  //   initialMonthYearPickerMode: MonthYearPickerMode.month,
                                  //   context: context,
                                  //   initialDate: DateTime.now(),
                                  //   firstDate: DateTime(2019),
                                  //   lastDate: DateTime(2029),
                                  // );

                                  if (selected != null) {
                                    homeController.getMonth.value =
                                        selected.month;
                                    homeController.getYear.value =
                                        selected.year;

                                    homeController.month.value = (selected
                                                .month ==
                                            01)
                                        ? "January"
                                        : (selected.month == 02)
                                            ? "February"
                                            : (selected.month == 03)
                                                ? "March"
                                                : (selected.month == 04)
                                                    ? "April"
                                                    : (selected.month == 05)
                                                        ? "May"
                                                        : (selected.month == 06)
                                                            ? "June"
                                                            : (selected.month ==
                                                                    07)
                                                                ? "July"
                                                                : (selected.month ==
                                                                        08)
                                                                    ? "August"
                                                                    : (selected.month ==
                                                                            09)
                                                                        ? "September"
                                                                        : (selected.month ==
                                                                                10)
                                                                            ? "October"
                                                                            : (selected.month == 11)
                                                                                ? "November"
                                                                                : "December";
                                  }
                                  print(selected);
                                },
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                        color: ColorRes.lightRedClr,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Transform.scale(
                                        scale: 0.6,
                                        child: Image.asset(
                                          AssetRes.calenderIcon,
                                          color: ColorRes.black,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Obx(
                            () => CalenderPicker(
                              homeController.getYear.value,
                              homeController.getMonth.value,
                              DateTime.now(),
                              width: Get.width * 0.111,
                              height: Get.height * 0.12,
                              enableMultiSelection: false,
                              initialSelectedDate: DateTime.now(),
                              selectionColor: ColorRes.color74BDCB,
                              selectedTextColor: ColorRes.black,
                              monthTextStyle: appTextStyle(),
                              dayTextStyle: appTextStyle(
                                  fontSize: 8, color: ColorRes.greyClr),
                              dateTextStyle: appTextStyle(fontSize: 14),
                              onDateChange: (date) async {
                                homeController.getDate.value =
                                    date.toString().split(' ')[0].split('-')[2];

                                homeController.dashboardObjModel.value =
                                    await DashboardObjApi.dashboardObjDateApi(
                                        date.toString().split(' ')[0]);

                                homeController.month.value = (date.month == 1)
                                    ? "January"
                                    : (date.month == 2)
                                        ? "February"
                                        : (date.month == 3)
                                            ? "March"
                                            : (date.month == 4)
                                                ? "April"
                                                : (date.month == 5)
                                                    ? "May"
                                                    : (date.month == 6)
                                                        ? "June"
                                                        : (date.month == 7)
                                                            ? "July"
                                                            : (date.month == 8)
                                                                ? "August"
                                                                : (date.month ==
                                                                        9)
                                                                    ? "September"
                                                                    : (date.month ==
                                                                            10)
                                                                        ? "October"
                                                                        : (date.month ==
                                                                                11)
                                                                            ? "November"
                                                                            : "December";

                                print(date);
                              },
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                // fit: FlexFit.tight,
                child: Container(
                  // height:
                  //     (Get.height >= 712) ? Get.height * 0.5075 : Get.height * 0.51,
                  width: Get.width,
                  // constraints: BoxConstraints(
                  //     minHeight: Get.height * 0.1, maxHeight: Get.height * 0.6),
                  padding: EdgeInsets.only(
                      left: Get.width * 0.05,
                      right: Get.width * 0.05,
                      top: Get.height * 0.03),
                  decoration: const BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Obx(
                      () => (homeController.dashboardObjModel.value.data ==
                              null)
                          ? const SmallLoader()
                          : Column(
                              children: [
                                if (homeController
                                        .dashboardObjModel.value.data !=
                                    null)
                                  ...List.generate(
                                    homeController
                                        .dashboardObjModel.value.data!.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(
                                          bottom: Get.height * 0.01),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              (index == 0)
                                                  ? Container(
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              Get.width * 0.03,
                                                          bottom: Get.height *
                                                              0.015),
                                                      height: 18,
                                                      width: 18,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: ColorRes
                                                                  .color74BDCB,
                                                              width: 1)),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        height: 18,
                                                        width: 18,
                                                        decoration: BoxDecoration(
                                                            color: ColorRes
                                                                .color74BDCB,
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                                color: ColorRes
                                                                    .white,
                                                                width: 3)),
                                                      ),
                                                    )
                                                  : Container(
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              Get.width * 0.04,
                                                          bottom: Get.height *
                                                              0.015),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          color: ColorRes.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: ColorRes
                                                                  .color74BDCB,
                                                              width: 3)),
                                                    ),
                                              (index ==
                                                      homeController
                                                              .dashboardObjModel
                                                              .value
                                                              .data!
                                                              .length -
                                                          1)
                                                  ? Container(
                                                      height: Get.height * 0.16,
                                                      margin: EdgeInsets.only(
                                                        left: Get.width * 0.052,
                                                      ),
                                                      width: 2,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            const LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              ColorRes
                                                                  .color74BDCB,
                                                              ColorRes.white,
                                                            ]),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    )
                                                  : Container(
                                                      height: Get.height * 0.16,
                                                      margin: EdgeInsets.only(
                                                        left: Get.width * 0.052,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                            width: 1,
                                                            color: ColorRes
                                                                .color74BDCB,
                                                          )),
                                                    ),
                                            ],
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () async {
                                              homeController.loader.value =
                                                  true;
                                              homeController
                                                      .workListModel.value =
                                                  await WorkListApi
                                                      .workListApi();

                                              homeController
                                                      .singleObjModel.value =
                                                  await SingleObjApi
                                                      .singleObjApi();

                                              homeController
                                                      .taskListModel.value =
                                                  await TaskListApi
                                                      .taskListApi();

                                              PrefService.setValue(
                                                  "objectId",
                                                  homeController
                                                      .dashboardObjModel
                                                      .value
                                                      .data?[index]
                                                      .id);

                                              homeController.loader.value =
                                                  false;

                                              Get.offNamedUntil(
                                                AppRes.restaurantAthenPage,
                                                (route) => false,
                                                arguments: [
                                                  homeController
                                                      .dashboardObjModel
                                                      .value
                                                      .data![index]
                                                      .objects
                                                      ?.clientName,
                                                  homeController.workListModel
                                                      .value.data![index],
                                                  input,
                                                  textEditingController,
                                                  [],
                                                ],
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  bottom: Get.height * 0.02),
                                              padding: EdgeInsets.only(
                                                  left: Get.width * 0.05,
                                                  right: Get.width * 0.05,
                                                  top: Get.height * 0.02,
                                                  bottom: Get.height * 0.02),
                                              // height: Get.height * 0.18,
                                              width: Get.width * 0.78,
                                              constraints: BoxConstraints(
                                                  minHeight: Get.height * 0.05,
                                                  maxHeight: Get.height * 0.18),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: ColorRes.backgroundColor,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${homeController.dashboardObjModel.value.data![index].objects?.clientName}"
                                                                .tr,
                                                            style: appTextStyle(
                                                                fontSize: 15),
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: ("objectKeyNumber"
                                                                          .tr +
                                                                      ": "),
                                                                  style:
                                                                      appTextStyle(
                                                                    color: ColorRes
                                                                        .greyClr,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ('${homeController.dashboardObjModel.value.data![index].objects?.keyNumber}'),
                                                                  recognizer:
                                                                      TapGestureRecognizer()
                                                                        ..onTap =
                                                                            () {},
                                                                  style:
                                                                      appTextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: ("objectWorkHours"
                                                                          .tr +
                                                                      ": "),
                                                                  style:
                                                                      appTextStyle(
                                                                    color: ColorRes
                                                                        .greyClr,
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ('${homeController.dashboardObjModel.value.data![index].hour.toString().split("-")[0]}:${homeController.dashboardObjModel.value.data![index].hour.toString().split("-")[1]}'),
                                                                  style:
                                                                      appTextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                  height: 12,
                                                                  width: 12,
                                                                  child: Image
                                                                      .asset(
                                                                    AssetRes
                                                                        .clockIcon,
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                  )),
                                                              SizedBox(
                                                                width:
                                                                    Get.width *
                                                                        0.008,
                                                              ),
                                                              Text(
                                                                "objectTime".tr,
                                                                style: appTextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                            ],
                                                          ),
                                                          Text(
                                                            "${homeController.dashboardObjModel.value.data![index].fromTime.toString().split("-")[0]}:"
                                                            "${homeController.dashboardObjModel.value.data![index].fromTime.toString().split("-")[1]}"
                                                            " to "
                                                            "${homeController.dashboardObjModel.value.data![index].at.toString().split(":")[0]}:"
                                                            "${homeController.dashboardObjModel.value.data![index].at.toString().split(":")[1]}",
                                                            style: appTextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 40,
                                                    padding: EdgeInsets.only(
                                                        left: Get.width * 0.03,
                                                        right:
                                                            Get.width * 0.02),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: ColorRes
                                                          .backgroundColor,
                                                      border: Border.all(
                                                          width: 2,
                                                          color:
                                                              ColorRes.white),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${homeController.dashboardObjModel.value.data![index].objects?.address}"
                                                              .tr,
                                                          style: appTextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                ColorRes.white,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              Transform.scale(
                                                            scale: 0.4,
                                                            child: Image.asset(
                                                                AssetRes
                                                                    .locationIcon),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: Get.width * 0.05,
                                      right: Get.width * 0.005),
                                  height: Get.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99),
                                      color: ColorRes.backgroundColor),
                                  child: Row(
                                    children: [
                                      Text(
                                        "chooseAdditionalObject".tr,
                                        style: appTextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Spacer(),
                                      FloatingActionButton(
                                        backgroundColor: ColorRes.white,
                                        mini: true,
                                        elevation: 10,
                                        onPressed: () {
                                          homeController.onAddTap();
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: ColorRes.color74BDCB,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                Obx(
                                  () => (homeController.isSearch.value == true)
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "searchObject".tr,
                                                  style: appTextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.02,
                                            ),
                                            Container(
                                              width: Get.width,
                                              height: Get.height * 0.08,
                                              decoration: const BoxDecoration(
                                                  color:
                                                      ColorRes.backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: TextField(
                                                controller: homeController
                                                    .searchCon.value,
                                                onChanged: (val) {
                                                  setState(() {});
                                                },
                                                decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        homeController
                                                            .onTapSearchIcon();
                                                      },
                                                      icon:
                                                          // (homeController.searchCon
                                                          //         .value.text.isNotEmpty)
                                                          //     ?
                                                          Obx(() =>
                                                              (homeController
                                                                      .searchCon
                                                                      .value
                                                                      .text
                                                                      .isNotEmpty)
                                                                  ? const Icon(
                                                                      Icons
                                                                          .keyboard_arrow_up_rounded,
                                                                      color: ColorRes
                                                                          .color74BDCB,
                                                                      size: 30,
                                                                    )
                                                                  : const Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: ColorRes
                                                                          .color74BDCB,
                                                                      size: 30,
                                                                    )),
                                                    ),
                                                    prefixIcon: Transform.scale(
                                                      scale: 0.3,
                                                      child: Image.asset(
                                                          AssetRes.searchIcon),
                                                    ),
                                                    hintStyle: appTextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    hintText: "Search here".tr),
                                              ),
                                            ),
                                            Obx(
                                              () =>
                                                  (homeController
                                                          .searchCon
                                                          .value
                                                          .text
                                                          .isNotEmpty)
                                                      ? Container(
                                                          alignment:
                                                              Alignment.center,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left:
                                                                      Get.width *
                                                                          0.05,
                                                                  right:
                                                                      Get.width *
                                                                          0.05),
                                                          width: Get.width,
                                                          // height: Get.height * 0.08,
                                                          decoration: BoxDecoration(
                                                              color: ColorRes
                                                                  .white,
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .backgroundColor,
                                                                  width: 2),
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20))),
                                                          child: Obx(
                                                            () => Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                      Get.height *
                                                                          0.02,
                                                                ),
                                                                ...List.generate(
                                                                    homeController
                                                                        .unAssignObjModel
                                                                        .value
                                                                        .object!
                                                                        .length,
                                                                    (index) {
                                                                  if (homeController
                                                                      .unAssignObjModel
                                                                      .value
                                                                      .object![
                                                                          index]
                                                                      .clientName!
                                                                      .toLowerCase()
                                                                      .contains(homeController
                                                                          .searchCon
                                                                          .value
                                                                          .text
                                                                          .toLowerCase())) {
                                                                    // homeController.asignad = List.generate(
                                                                    //     homeController
                                                                    //         .unAssignObjModel
                                                                    //         .value
                                                                    //         .object!
                                                                    //         .length,
                                                                    //     (index) =>
                                                                    //         false);

                                                                    return Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom:
                                                                              Get.height * 0.02),
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "${homeController.unAssignObjModel.value.object![index].clientName}".tr,
                                                                                style: appTextStyle(fontSize: 12),
                                                                              ),
                                                                              RichText(
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: ("keyNumber".tr + ": "),
                                                                                      style: appTextStyle(
                                                                                        color: ColorRes.greyClr,
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: ('${homeController.unAssignObjModel.value.object![index].keyNumber}'),
                                                                                      recognizer: TapGestureRecognizer()..onTap = () {},
                                                                                      style: appTextStyle(
                                                                                        fontSize: 9,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const Spacer(),
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              showDialog(
                                                                                  barrierDismissible: false,
                                                                                  context: context,
                                                                                  builder: (context) => AlertDialog(
                                                                                        alignment: Alignment.center,
                                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                        content: Text(
                                                                                          "Are you sure you want to add this object in your calendar?",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: appTextStyle(
                                                                                            fontSize: 14,
                                                                                          ),
                                                                                        ),
                                                                                        actionsAlignment: MainAxisAlignment.end,
                                                                                        actions: [
                                                                                          ElevatedButton(
                                                                                            onPressed: () {
                                                                                              Get.back();
                                                                                            },
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              primary: ColorRes.color74BDCB,
                                                                                            ),
                                                                                            child: Text(
                                                                                              "No",
                                                                                              style: appTextStyle(fontSize: 12, color: ColorRes.white),
                                                                                            ),
                                                                                          ),
                                                                                          ElevatedButton(
                                                                                            onPressed: () {
                                                                                              Get.back();
                                                                                              homeController.changedAs(index, true);
                                                                                            },
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              primary: ColorRes.color74BDCB,
                                                                                            ),
                                                                                            child: Text(
                                                                                              "Yes",
                                                                                              style: appTextStyle(fontSize: 12, color: ColorRes.white),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ));
                                                                            },
                                                                            child:
                                                                                GetBuilder<HomeController>(
                                                                              id: 'asObj',
                                                                              builder: (homeController) => Container(
                                                                                  height: 20,
                                                                                  width: 20,
                                                                                  decoration: BoxDecoration(
                                                                                    border: Border.all(color: ColorRes.color74BDCB),
                                                                                    color: (homeController.asignad[index] == true) ? ColorRes.color74BDCB : ColorRes.white,
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: (homeController.asignad[index] == true)
                                                                                      ? const Icon(
                                                                                          Icons.check_rounded,
                                                                                          color: ColorRes.white,
                                                                                          size: 12,
                                                                                        )
                                                                                      : const SizedBox()),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return SizedBox();
                                                                  }
                                                                })
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : SizedBox(),
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(
            () => (homeController.loader.value == true)
                ? const SmallLoader()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  different({DateTime? first, DateTime? last}) async {
    int data = last!.difference(first!).inDays;
    // ignore: avoid_print

    setState(() {
      data++;
      // days = data;
      // ignore: avoid_print
      print(data);
    });
  }
}
