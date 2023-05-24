import 'dart:io' as io;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restaurant_athen_app/api_calling/add_problem_api.dart';
import 'package:restaurant_athen_app/api_calling/delete_problem_api.dart';
import 'package:restaurant_athen_app/api_calling/edit_problem_api.dart';
import 'package:restaurant_athen_app/api_calling/single_obj_api.dart';
import 'package:restaurant_athen_app/common/button.dart';
import 'package:restaurant_athen_app/models/add_problem_model.dart';
import 'package:restaurant_athen_app/models/edit_problem_model.dart';
import 'package:restaurant_athen_app/models/edit_signature_model.dart';
import 'package:restaurant_athen_app/models/single_obj_model.dart';
import 'package:restaurant_athen_app/models/work_list_model.dart';
import 'package:restaurant_athen_app/screens/done_screen/done.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
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

  String stsDropDown = "Pending";
  RxString updateImg = ''.obs;

  List<Widget> input = [];

  Rx<Image>? signature;
  List<TextEditingController> textEditingController = [];
  Rx<WorkListModel> workListModel = WorkListModel().obs;
  // int index = 0;

  addProblemOnTap({required BuildContext context}) {
    print("add =======================");
    textEditingController.add(TextEditingController());
    input.add(getInput(input.length, context, textEditingController));
    update(['problem']);

    // print("========================= INPUT ============================");
    // print(jsonEncode({"inputList": input}));
    // print("======================================================");

    // Get.offUntil(
    //   MaterialPageRoute(builder: (context) => DoneScreen()),
    //   (route) => false,
    // );
  }

  Rx<io.File>? imagePath;
  List imageUrl = [];

  io.File? img;

  /// Open Camera
  navigateToCamera() async {
    final path = await cameraPickImage();
    if (path != null) {
      img = io.File(path);
      // addImg(img: path);
      imageUrl.add(img);
      // print(path);
      update(['pbImg']);
      update(['problem']);
    }
  }

  ///Open Gallary
  navigateToGallary() async {
    final path = await gallaryPickImage();
    if (path != null) {
      img = io.File(path);
      // addImg(img: path);
      imageUrl.add(img);
      // print(path);
      update(['pbImg']);
      update(['problem']);
    }
  }

  Future<String?> gallaryPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.back();
      print(
          "======================================= IMG NAME ======================================================");
      print("${pickedFile.name}");
      return pickedFile.path;
    }

    Get.back();
    return null;
  }

  ///Camera
  Future<String?> cameraPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Get.back();
      return pickedFile.path;
    }
    Get.back();
    return null;
  }

  AddProblemModel addProblemModel = AddProblemModel();
  EditProblemModel editProblemModel = EditProblemModel();

  getInput(int index, BuildContext context,
      List<TextEditingController> textEditingController) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * 0.04),
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
          GetBuilder<RestaurantAthenController>(
            id: 'pbImg',
            builder: (restaurantAthenController) => (restaurantAthenController
                        .imageUrl.isEmpty ||
                    restaurantAthenController.imageUrl[index] == "")
                ? Container(
                    height: Get.height * 0.25,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: ColorRes.backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                          elevation: 10,
                          barrierColor: ColorRes.black.withOpacity(0.4),
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
                                    navigateToCamera();
                                    Get.back();
                                  },
                                  child: ListTile(
                                    leading: const Icon(Icons.camera,
                                        color: ColorRes.white),
                                    title: Text(
                                      "Camera".tr,
                                      style: appTextStyle(
                                          fontSize: 16, color: ColorRes.white),
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
                                    navigateToGallary();
                                    Get.back();
                                  },
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.photo_size_select_actual_outlined,
                                      color: ColorRes.white,
                                    ),
                                    title: Text(
                                      "Gallery".tr,
                                      style: appTextStyle(
                                          fontSize: 16, color: ColorRes.white),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.add,
                        color: ColorRes.color74BDCB.withOpacity(0.5),
                        size: 100,
                      ),
                    ))
                : InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        elevation: 10,
                        barrierColor: ColorRes.black.withOpacity(0.4),
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
                                onTap: () async {
                                  final path = await gallaryPickImage();
                                  if (path != null) {
                                    img = io.File(path);
                                    // addImg(img: path);
                                    restaurantAthenController.imageUrl[index] =
                                        img;
                                    // print(path);
                                    update(['pbImg']);
                                    update(['problem']);
                                  }
                                  // Get.back();
                                },
                                child: ListTile(
                                  leading: const Icon(Icons.camera,
                                      color: ColorRes.white),
                                  title: Text(
                                    "Camera".tr,
                                    style: appTextStyle(
                                        fontSize: 16, color: ColorRes.white),
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
                                  final path = await gallaryPickImage();
                                  if (path != null) {
                                    img = io.File(path);
                                    // addImg(img: path);
                                    restaurantAthenController.imageUrl[index] =
                                        img;
                                    // print(path);
                                    update(['pbImg']);
                                    update(['problem']);
                                  }
                                  // Get.back();
                                },
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.photo_size_select_actual_outlined,
                                    color: ColorRes.white,
                                  ),
                                  title: Text(
                                    "Gallery".tr,
                                    style: appTextStyle(
                                        fontSize: 16, color: ColorRes.white),
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
                            color: ColorRes.backgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            restaurantAthenController.imageUrl[index],
                            fit: BoxFit.cover,
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
              padding: EdgeInsets.only(left: Get.width * 0.05),
              width: Get.width,
              height: Get.height * 0.065,
              decoration: BoxDecoration(
                  color: ColorRes.backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: textEditingController[index],
                textAlignVertical: TextAlignVertical.center,
                // expands: true,
                // maxLines: 1,
                // minLines: 1,

                style: appTextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                minLines: 1,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorRes.backgroundColor,
                    contentPadding: const EdgeInsets.all(0),
                    // constraints:
                    //     BoxConstraints.tight(Size(Get.width, Get.height * 0.07)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    hintMaxLines: 2,
                    hintText: "Enter your problem reason here".toString().tr,
                    hintStyle: appTextStyle(
                        fontSize: 12,
                        color: ColorRes.greyClr,
                        fontWeight: FontWeight.w400)),
              )),
          SizedBox(
            height: Get.height * 0.02,
          ),
          GetBuilder<RestaurantAthenController>(
            id: 'aud',
            builder: (restaurantAthenController) => (restaurantAthenController
                        .addProblemModel.message !=
                    "Problem Added Successfully")
                ? button(
                    fontSize: 14,
                    txt: "Add",
                    onTap: () async {
                      restaurantAthenController.addProblemModel =
                          await AddProblemApi.addProblemApi(
                              image: restaurantAthenController.imageUrl[index],
                              objectId:
                                  PrefService.getInt("objectId").toString(),
                              reason: textEditingController[index].value.text);

                      restaurantAthenController.singleObjModel.value =
                          await SingleObjApi.singleObjApi();
                      // setState(() {
                      // });

                      restaurantAthenController.update(['aud']);
                    })
                : Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: button(
                              fontSize: 14,
                              txt: "Edit",
                              onTap: () async {
                                editProblemModel =
                                    await EditProblemApi.editProblemApi(
                                  reason:
                                      textEditingController[index].value.text,
                                  image: restaurantAthenController
                                      .imageUrl[index].path,
                                );
                              })),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Expanded(
                        flex: 1,
                        child: FloatingActionButton(
                          heroTag: "1st",
                          elevation: 0,
                          backgroundColor: ColorRes.backgroundColor,
                          onPressed: () async {
                            await DeleteProblemApi.deleteProblemApi();
                            restaurantAthenController.input.removeAt(index);
                            restaurantAthenController.imageUrl[index] = "";
                            textEditingController[index].value =
                                TextEditingController().value;
                            restaurantAthenController.update(['aud']);
                            restaurantAthenController.update(['problem']);
                          },
                          child: Transform.scale(
                            scale: 0.5,
                            child: Image.asset(AssetRes.deleteIcon),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Rx<ScrollController> scrollController = ScrollController().obs;

  submitOnTap() {
    Get.offUntil(
      MaterialPageRoute(
        builder: (context) => DoneScreen(),
      ),
      (route) => false,
    );
  }

  requestForSignatureOnTap({
    String? clientName,
    dynamic args,
  }) async {
    Get.toNamed(AppRes.signaturePage, arguments: [clientName, 'add', args]);
  }

  EditSignatureModel editSignatureModel = EditSignatureModel();
  editSignatureOnTap({
    String? clientName,
    dynamic args,
  }) {
    Get.toNamed(AppRes.signaturePage, arguments: [clientName, 'edit', args]);
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

  Rx<SingleObjModel> singleObjModel = SingleObjModel().obs;
  List updatedImgList = [];

  singleObjApiCall() async {
    singleObjModel.value = await SingleObjApi.singleObjApi();

    updatedImgList = List.generate(
        singleObjModel.value.data!.problems!.length, (index) => "");

    textEditingController = List.generate(
        singleObjModel.value.data!.problems!.length,
        (index) => TextEditingController());

    //... now convert
    // .... pageImage.bytes to image

    // for (int i = 0; i <= singleObjModel.value.data!.problems!.length; i++) {
    //   textEditingController =
    //       singleObjModel.value.data!.problems![i].reason;
    // }

    // textEditingController = singleObjModel.value.data!.problems!.map((e) => e.reason).toList();
  }

  List<PDFDocument>? document = [];

  PDFDocument? pageImage;
  var pdfFile;

  pdfDownload(String pdfUrl, String name) async {
    PermissionStatus storagePermission = await Permission.storage.request();

    try {
      if (storagePermission.isGranted) {
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        // newPath = newPath + "/PDF_Download";
        // directory = Directory(name);

        File saveFile = File(directory.path + "/$name");
        if (kDebugMode) {
          print(saveFile.path);
        }
        // if (!await directory.exists()) {
        //   await directory.create(recursive: true);
        // }
        // if (await directory.exists()) {
        await Dio().download(
          pdfUrl,
          saveFile.path,
        );
        // }
      }
      return true;
    } catch (e) {
      print(
          "========================= ERROR $e ==================================================");
      return false;
    }
  }

  downloadPdf(String pdfUrl, String name) async {
    try {
      /// setting filename
      final filename = name;
      String dir = (await getApplicationDocumentsDirectory()).path;
      if (await File('$dir/$filename').exists()) return File('$dir/$filename');

      String url = pdfUrl;

      /// requesting http to get url
      var request = await HttpClient().getUrl(Uri.parse(url));

      /// closing request and getting response
      var response = await request.close();

      /// getting response data in bytes
      var bytes = await consolidateHttpClientResponseBytes(response);

      /// generating a local system file with name as 'filename' and path as '$dir/$filename'
      File file = File('$dir/$filename');
      print("============= FILEPATH OLD ========================");
      print(file.path);

      /// writing bytes data of response in the file.
      await file.writeAsBytes(bytes);

      print("============= FILEPATH ========================");
      print(file.path);

      return file;
    } catch (err) {
      print("============================ ERROR ============================");
      print(err);
    }
    // final appStorage = await getApplicationDocumentsDirectory();
    // final file = '${appStorage.path}/$name';
    //
    // print("================================== PATH ${appStorage.path}");
    //
    // await Dio().download(url, file, onReceiveProgress: (received, total) {
    //   if (total != -1) {
    //     print((received / total * 100).toStringAsFixed(0) + "%");
    //     //you can build progressbar feature too
    //   }
    // });

    // final raf = file.openSync(mode: io.FileMode.write);
    // raf.writeFromSync(response.data);
    // await raf.close();

    // return file;
  }

  pdfTOImg(url) async {
    print("==================== DOCURL $url");

    pageImage = await PDFDocument.fromURL(url);
    document?.add(pageImage!);

    update(['pdf']);
    print("==================== DOC $pageImage");
    print("==================== DOCPAGEIMG $document");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    singleObjApiCall();
  }
}
