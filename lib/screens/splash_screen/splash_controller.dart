import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Future.delayed(Duration(seconds: 5), () {
      Get.toNamed(AppRes.loginPage);
    });
  }
}
