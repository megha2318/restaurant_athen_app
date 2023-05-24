import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/task_status_update_api.dart';
import 'package:restaurant_athen_app/models/task_status_update_model.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

RestaurantAthenController restaurantAthenController =
    Get.put(RestaurantAthenController());

TaskStatusUpdateModel taskStatusUpdateModel = TaskStatusUpdateModel();

Widget titleWithRoundedCheck({
  required String title,
  String? empName,
  required List<String> items,
  required String dropdownVal,
  bool? val,
  int? id,
  void Function()? onTap,
}) {
  return Container(
    margin: EdgeInsets.only(top: Get.height * 0.02),
    padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.03),
    height: Get.height * 0.065,
    decoration: BoxDecoration(
      color: ColorRes.backgroundColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        GetBuilder<RestaurantAthenController>(
          id: 'txt',
          builder: (restaurantAthenController) => Text(
            title.tr,
            style: appTextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: (dropdownVal == "Complete")
                  ? ColorRes.black
                  : ColorRes.greyClr,
            ),
          ),
        ),
        const Spacer(),
        GetBuilder<RestaurantAthenController>(
          id: 'emp',
          builder: (restaurantAthenController) => Visibility(
            visible: (dropdownVal != "Pending") ? true : false,
            child: Text(
              '$empName'.tr,
              style: appTextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: ColorRes.greyClr,
              ),
            ),
          ),
        ),
        const Spacer(),
        GetBuilder<RestaurantAthenController>(
          id: "sts",
          builder: (restaurantAthenController) => (dropdownVal == "Complete")
              ? Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: ColorRes.color74BDCB,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: ColorRes.white,
                    size: 12,
                  ))
              : Container(
                  alignment: Alignment.center,
                  height: Get.height * 0.04,
                  padding: EdgeInsets.only(
                      left: Get.width * 0.03, right: Get.width * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: ColorRes.color74BDCB,
                  ),
                  child: PopupMenuButton<String>(
                    itemBuilder: (context) {
                      return (dropdownVal == "InProgress")
                          ? List.generate(1, (index) => "Complete")
                              .map((String items) {
                              return PopupMenuItem(
                                value: items,
                                child: Text(
                                  items.tr,
                                  style: appTextStyle(
                                      fontSize: 12,
                                      color: ColorRes.color74BDCB),
                                ),
                              );
                            }).toList()
                          : items.map((str) {
                              return PopupMenuItem(
                                value: str,
                                child: Text(
                                  str,
                                  style: appTextStyle(
                                      fontSize: 11,
                                      color: ColorRes.color74BDCB),
                                ),
                              );
                            }).toList();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          dropdownVal,
                          style:
                              appTextStyle(fontSize: 12, color: ColorRes.white),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: ColorRes.white,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(5),
                    offset: Offset(Get.width * 0.05, Get.height * 0.038),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onSelected: (v) async {
                      print('!!!===== $v');

                      dropdownVal = v.toString();
                      String status = v.toString() == "Pending"
                          ? "0"
                          : v.toString() == "InProgress"
                              ? "1"
                              : "2";
                      restaurantAthenController.update(['sts']);
                      restaurantAthenController.update(['txt']);

                      await TaskStatusUpdateApi.taskStatusUpdateApi(
                        id: id,
                        status: status.toString(),
                      );
                    },
                  )
                  // DropdownButton(
                  //   // Initial Value
                  //   // value: dropdownVal.toString() == "" ? null : dropdownVal,
                  //
                  //   hint: Center(
                  //     child: Text(
                  //       dropdownVal,
                  //       style:
                  //           appTextStyle(fontSize: 12, color: ColorRes.white),
                  //     ),
                  //   ),
                  //   underline: Container(),
                  //   // Down Arrow Icon
                  //   icon: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     color: ColorRes.white,
                  //   ),
                  //
                  //   borderRadius: BorderRadius.circular(20),
                  //   alignment: AlignmentDirectional.center,
                  //   // Array list of items
                  //   items: (dropdownVal == "InProgress")
                  //       ? List.generate(1, (index) => "Complete")
                  //           .map((String items) {
                  //           return DropdownMenuItem(
                  //             value: items,
                  //             child: Text(items.tr),
                  //           );
                  //         }).toList()
                  //       : items.map((String items) {
                  //           return DropdownMenuItem(
                  //             value: items,
                  //             child: Text(items.tr),
                  //           );
                  //         }).toList(),
                  //   // After selecting the desired option,it will
                  //   // change button value to selected value
                  //   onChanged: (value) {
                  //     print(value);
                  //     dropdownVal = value.toString();
                  //     restaurantAthenController.update(['sts']);
                  //     restaurantAthenController.update(['txt']);
                  //     // restaurantAthenController.update(['status']);
                  //     // loginController.onTapDropDownVal(value);
                  //   },
                  // ),
                  //
                  ),
        ),
      ],
    ),
  );
}
