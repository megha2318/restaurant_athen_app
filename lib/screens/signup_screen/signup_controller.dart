import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  Rx<TextEditingController> firstNameCon = TextEditingController().obs;
  Rx<TextEditingController> nameCon = TextEditingController().obs;
  Rx<TextEditingController> userNameCon = TextEditingController().obs;
  Rx<TextEditingController> emailIdCon = TextEditingController().obs;
  Rx<TextEditingController> contactNumCon = TextEditingController().obs;
  Rx<TextEditingController> addressCon = TextEditingController().obs;
  Rx<TextEditingController> postCodeCon = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> joinDateCon = TextEditingController().obs;
  Rx<TextEditingController> empNrCon = TextEditingController().obs;
  Rx<TextEditingController> vacationDaysCon = TextEditingController().obs;
  Rx<TextEditingController> workingHoursCon = TextEditingController().obs;

  Rx<File>? imagePath;
  String? imageUrl = "";

  /// Open Camera
  navigateToCamera() async {
    final path = await cameraPickImage();
    if (path != null) {
      imagePath?.value = File(path);
      // addImg(img: path);
      imageUrl = path;
      update(['img']);
    }
  }

  ///Open Gallary
  navigateToGallary() async {
    final path = await gallaryPickImage();
    if (path != null) {
      imagePath?.value = File(path);
      // addImg(img: path);
      imageUrl = path;
      update(['img']);
    }
  }

  Future<String?> gallaryPickImage() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Get.back();
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
}
