import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/common/half_circle.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

class ShowPDF extends StatelessWidget {
  ShowPDF({Key? key, this.pdfDocument}) : super(key: key);

  PDFDocument? pdfDocument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            halfCircle(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: Get.height * 0.07,
                      left: Get.width * 0.05,
                      right: Get.width * 0.05),
                  // padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
                  height: Get.height * 0.12,
                  width: Get.width,
                  // color: ColorRes.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      FloatingActionButton(
                        backgroundColor: ColorRes.white,
                        mini: true,
                        heroTag: "n1",
                        elevation: 0.5,
                        onPressed: () {
                          // (flow == "hm") ?
                          Get.back();
                          // : Get.offNamedUntil(AppRes.loginPage, (route) => false);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: ColorRes.black,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Text(
                        "PDF",
                        style: appTextStyle(fontSize: 30),
                      ),
                      Spacer(),
                      Image.asset(AssetRes.logoImg),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Expanded(
                  child: Container(
                    child: PDFViewer(
                      indicatorBackground:
                          ColorRes.color74BDCB.withOpacity(0.5),
                      progressIndicator: const SmallLoader(),
                      lazyLoad: false,
                      backgroundColor: Colors.transparent,
                      document: pdfDocument ?? PDFDocument(),
                      isOnePage: false,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
