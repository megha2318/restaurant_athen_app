import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_athen.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/screens/signature_screen/signature_controller.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureScreen extends StatelessWidget {
  SignatureScreen({Key? key}) : super(key: key);

  SignaturController signaturController = Get.put(SignaturController());
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  Image? signature;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarHome(title: "Restaurant Athen"),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Text(
              "Create Signature".tr,
              style: appTextStyle(fontSize: 30),
            ),
            SizedBox(
              height: Get.height * 0.008,
            ),
            Text(
              "Please do your signature".tr,
              style: appTextStyle(
                  fontSize: 14,
                  color: ColorRes.greyClr,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // height: Get.height * 0.5,
                width: Get.width,
                decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(15)),
                child: SfSignaturePad(
                    key: signatureGlobalKey,
                    backgroundColor: Colors.transparent,
                    strokeColor: Colors.black,
                    minimumStrokeWidth: 1.0,
                    maximumStrokeWidth: 5.0),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            button(
                txt: "Save",
                onTap: () async {
                  final data = await signatureGlobalKey.currentState!
                      .toImage(pixelRatio: 3.0);
                  final bytes =
                      await data.toByteData(format: ui.ImageByteFormat.png);
                  signature = Image.memory(bytes!.buffer.asUint8List());

                  Get.off(() => RestaurantAthenScreen(
                        signature: signature,
                        reverse: true,
                      ));
                }),
            SizedBox(
              height: Get.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
