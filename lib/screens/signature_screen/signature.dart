import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:restaurant_athen_app/api_calling/add_signature_api.dart';
import 'package:restaurant_athen_app/api_calling/edit_signature_api.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/common/loaders.dart';
import 'package:restaurant_athen_app/models/add_signature_model.dart';
import 'package:restaurant_athen_app/models/edit_signature_model.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_athen.dart';
import 'package:restaurant_athen_app/screens/restaurant_athen_screen/restaurant_controller.dart';
import 'package:restaurant_athen_app/screens/signature_screen/signature_controller.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureScreen extends StatelessWidget {
  SignatureScreen({Key? key}) : super(key: key);

  SignaturController signaturController = Get.put(SignaturController());
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  Image? signature;
  final RestaurantAthenController restaurantAthenController =
      Get.put(RestaurantAthenController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  AddSignatureModel addSignatureModel = AddSignatureModel();
  EditSignatureModel editSignatureModel = EditSignatureModel();
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;

    String clientName = args[0];
    String btnTyp = args[1];

    return Scaffold(
      key: _key,
      drawer: drawer(),
      backgroundColor: ColorRes.backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Get.width * 0.05, right: Get.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            "$clientName",
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
                Text(
                  "createSignLabel".tr,
                  style: appTextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: Get.height * 0.008,
                ),
                Text(
                  "createSignText".tr,
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
                    txt: (btnTyp == "add") ? "saveSignBtn".tr : "editBtn".tr,
                    onTap: () async {
                      signaturController.loader.value = true;
                      final data = await signatureGlobalKey.currentState!
                          .toImage(pixelRatio: 3.0);

                      final bytes =
                          await data.toByteData(format: ui.ImageByteFormat.png);

                      var tempDir = await getTemporaryDirectory();
                      signature = Image.memory(bytes!.buffer.asUint8List());

                      File file = await File('${tempDir.path}/img.jpg')
                          .writeAsBytes(bytes.buffer.asUint8List());

                      var url = Uri.file(file.path, windows: true);

                      (btnTyp == "add")
                          ? addSignatureModel =
                              await AddSignatureApi.addSignatureApi(
                                  signature: file.path, objectId: "7"
                                  // PrefService.getInt("objectId").toString()
                                  )
                          : editSignatureModel =
                              await EditSignatureApi.editSignatureApi(
                                  id: "7", signature: file.path);

                      PrefService.setValue(
                          "signatureId",
                          restaurantAthenController
                              .singleObjModel.value.data!.signature![0].id);

                      signaturController.loader.value = false;

                      Get.off(
                          () => RestaurantAthenScreen(
                                signature: signature,
                                reverse: true,
                              ),
                          arguments: [
                            clientName,
                            args[2],
                            [],
                            <TextEditingController>[],
                            restaurantAthenController.singleObjModel.value.data,
                          ]);
                    }),
                SizedBox(
                  height: Get.height * 0.04,
                ),
              ],
            ),
          ),
          Obx(
            () => (signaturController.loader.value == true)
                ? const SmallLoader()
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
