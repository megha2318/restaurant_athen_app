import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_athen_app/api_calling/edit_profile_api.dart';
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/city_list_model.dart';
import 'package:restaurant_athen_app/models/edit_profile_model.dart';
import 'package:restaurant_athen_app/models/profile_model.dart';

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

  File? imagePath;
  String? imageUrl = "";

  Rx<ProfileModel> profileModel = ProfileModel().obs;
  Rx<CityListModel> cityListModel = CityListModel().obs;
  var citylist = <String>[].obs;
  var list;

  List<String> listC = [];
  List<Map<String, int>> dropdownItems = [];
  List<String> listCity = [];

  /// Open Camera
  navigateToCamera() async {
    final path = await cameraPickImage();
    if (path != null) {
      imagePath = File(path);
      // addImg(img: path);
      imageUrl = path;
      update(['img']);
    }
  }

  ///Open Gallary
  navigateToGallary() async {
    final path = await gallaryPickImage();
    if (path != null) {
      imagePath = File(path);
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

  EditProfileModel editProfileModel = EditProfileModel();

  List editProfile = [];
  updateOnTap() async {
    editProfileModel = await EditProfileApi.editProfileApi(
      firstName: firstNameCon.value.text,
      lastName: nameCon.value.text,
      userName: userNameCon.value.text,
      email: emailIdCon.value.text,
      phoneNumber: contactNumCon.value.text,
      address: addressCon.value.text,
      amountOfHoursWork: workingHoursCon.value.text,
      amountOfVacationDays: vacationDaysCon.value.text,
      // cityId: city.value.text,
      cityName: city.value.text,
      employeeNumber: empNrCon.value.text,
      joinDate: joinDateCon.value.text,
      zipcode: postCodeCon.value.text,
      profile: imagePath,
    );
    Get.back();

    print("EDIT PROFILE ==================================================");
    flutterToast("${editProfileModel.message}");
    print(editProfileModel.message);
  }

  @override
  void onInit() {
    super.onInit();

    // firstNameCon.value.text = profileModel.value.firstName ?? "";
    // nameCon.value.text = profileModel.value.lastName ?? "";
    // userNameCon.value.text = profileModel.value.username ?? "";
    // emailIdCon.value.text = profileModel.value.email ?? "";
    // contactNumCon.value.text = profileModel.value.phoneNumber ?? "";
    // addressCon.value.text = profileModel.value.address ?? "";
    // postCodeCon.value.text = profileModel.value.zipcode ?? "";
    // city.value.text = profileModel.value.cityId ?? "";
    // joinDateCon.value.text = profileModel.value.joinDate.toString();
    // vacationDaysCon.value.text = profileModel.value.amountOfVacationDays ?? "";
    // empNrCon.value.text = profileModel.value.employeeNumber ?? "";
    // workingHoursCon.value.text = profileModel.value.amountOfHoursWork ?? "";
  }
}
