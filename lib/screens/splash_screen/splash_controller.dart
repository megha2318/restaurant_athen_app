import 'package:get/get.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Future.delayed(Duration(seconds: 5), () {
      PrefService.getBool(PrefKeys.login) == true
          ? Get.offNamedUntil(AppRes.homePage, (route) => false)
          : Get.offNamedUntil(AppRes.loginPage, (route) => false);
    });
  }
}
