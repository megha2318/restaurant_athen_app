import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/common/text_field.dart';
import 'package:restaurant_athen_app/screens/signup_screen/signup_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:restaurant_athen_app/utils/strings.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: ColorRes.backgroundColor,
      body: SizedBox(
        height: Get.height + 100,
        width: Get.width,
        child: Stack(
          children: [
            SizedBox(height: Get.height, width: Get.width, child: halfCircle()),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: Get.width * 0.05, right: Get.width * 0.05),
                child: Column(
                  children: [
                    appBar(isBack: true, flow: "hm"),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.myProfile.tr,
                              style: appTextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            GetBuilder<SignupController>(
                              id: "img",
                              builder: (signupController) => Stack(
                                alignment: const Alignment(1.2, 1.2),
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorRes.white,
                                    ),
                                    child: (signupController.imageUrl != "")
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: signupController
                                                  .imageUrl
                                                  .toString(),
                                            ))
                                        : Transform.scale(
                                            scale: 0.3,
                                            child: Image.asset(
                                              AssetRes.userIcon,
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: FloatingActionButton(
                                      heroTag: "addImg",
                                      backgroundColor: ColorRes.color74BDCB,
                                      elevation: 0,
                                      mini: true,
                                      onPressed: () {
                                        showModalBottomSheet(
                                          elevation: 10,
                                          barrierColor:
                                              ColorRes.black.withOpacity(0.4),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          backgroundColor: ColorRes.color74BDCB,
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                GestureDetector(
                                                  onTap: () {
                                                    signupController
                                                        .navigateToCamera();
                                                  },
                                                  child: ListTile(
                                                    leading: const Icon(
                                                        Icons.camera,
                                                        color: ColorRes.white),
                                                    title: Text(
                                                      "Camera".tr,
                                                      style: appTextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              ColorRes.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 0.3,
                                                  width: Get.width,
                                                  color: ColorRes.white,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    signupController
                                                        .navigateToGallary();
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
                                                          color:
                                                              ColorRes.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: ColorRes.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            textfield(
                                prefixImg: AssetRes.userIcon,
                                hintTxt: Strings.firstName,
                                controller:
                                    signupController.firstNameCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                prefixImg: AssetRes.userIcon,
                                hintTxt: Strings.name,
                                controller: signupController.nameCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                prefixImg: AssetRes.userIcon,
                                hintTxt: Strings.username,
                                controller: signupController.userNameCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                prefixImg: AssetRes.emailIcon,
                                hintTxt: Strings.emailId,
                                controller: signupController.emailIdCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                keyboardType: TextInputType.number,
                                prefixImg: AssetRes.phoneIcon,
                                hintTxt: Strings.contactNumber,
                                controller:
                                    signupController.contactNumCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                prefixImg: AssetRes.locationIcon,
                                hintTxt: Strings.address,
                                controller: signupController.addressCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            textfield(
                                keyboardType: TextInputType.number,
                                prefixImg: AssetRes.locationIcon,
                                hintTxt: Strings.postcode,
                                controller: signupController.postCodeCon.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            //// city dropdown ============================================

                            textfield(
                                prefixImg: AssetRes.locationIcon,
                                hintTxt: Strings.city,
                                controller: signupController.city.value),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Obx(
                                    () => InkWell(
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100));

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('dd-MM-yyyy')
                                                  .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16

                                          signupController
                                                  .joinDateCon.value.text =
                                              formattedDate; //set output date to TextField value.

                                        } else {}
                                      },
                                      child: textFieldWithoutSuffix(
                                          isOnTapTxtFld: true,
                                          prefixImg: AssetRes.calenderIcon,
                                          hintTxt: Strings.joinDate,
                                          controller: signupController
                                              .joinDateCon.value),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: textFieldWithoutSuffix(
                                      prefixImg: AssetRes.employeeIcon,
                                      hintTxt: Strings.vacationDays,
                                      controller: signupController
                                          .vacationDaysCon.value),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: textFieldWithoutSuffix(
                                      prefixImg: AssetRes.calenderIcon,
                                      hintTxt: Strings.employeeNr,
                                      controller:
                                          signupController.empNrCon.value),
                                ),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: textFieldWithoutSuffix(
                                      hintFontSize: 9,
                                      prefixImg: AssetRes.employeeIcon,
                                      hintTxt: Strings.workingHoursWeek,
                                      controller: signupController
                                          .workingHoursCon.value),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.06,
                            ),
                            button(
                                txt: Strings.update,
                                onTap: () {
                                  signupController.updateOnTap();
                                }),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

showDatePickerWidget(ctx, ontap, {bool? onlyFutureDate}) {
  // showCupertinoModalPopup is a built-in function of the cupertino library
  showCupertinoModalPopup(
    context: ctx,
    builder: (_) => Container(
      height: 500,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 400,
            color: Colors.white,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              mode: CupertinoDatePickerMode.date,
              initialDateTime:
                  onlyFutureDate != null ? DateTime.now() : DateTime(2001),
              maximumDate:
                  onlyFutureDate != null ? DateTime(2060) : DateTime.now(),
              maximumYear: onlyFutureDate != null
                  ? DateTime(2060).year
                  : DateTime.now().year,
              onDateTimeChanged: ontap,
              // minimumYear: onlyFutureDate != null
              //     ? DateTime.now().year
              //     : DateTime(2060).year ,
              // minimumDate: onlyFutureDate != null ? DateTime.now() : DateTime(2060) ,
            ),
          ),

          /// Close the modal
          CupertinoButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    ),
  );
}
