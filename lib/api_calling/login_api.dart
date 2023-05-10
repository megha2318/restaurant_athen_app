import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/models/login_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class LoginApi {
  static Future loginApi({
    String? username,
    String? password,
  }) async {
    try {
      String url = EndPoints.login;

      Map<String, dynamic> param = {
        "username": username.toString(),
        "password": password.toString(),
      };

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
      }, url: url, body: param);
      if (response != null && response.statusCode == 200) {
        print("login.....");
        //   bool? status = jsonDecode(response.body)["status"];
        //   if (status == false) {
        //     // errorToast(jsonDecode(response.body)["message"]);
        //   } else if (status == true) {
        //     // flutterToast(jsonDecode(response.body)["message"]);
        // await PrefService.setValue(
        //     PrefKeys.token,
        //     jsonDecode(response.body)["data"]["token"]["original"]
        //         ["access_token"]);
        //     /// login complete...
        //     // await PrefService.setValue(
        //     //     PrefKeys.token, jsonDecode(response.body)["token"]);
        //     // await PrefService.setValue(
        //     //     PrefKeys.loginId, jsonDecode(response.body)["data"]["id"]);
        await PrefService.setValue(PrefKeys.login, true);
        //     // Get.toNamed(AppRes.dashBoardScreen);
        Get.offNamedUntil(AppRes.homePage, (route) => false);
        print(response.body);

        return loginModelFromJson(response.body);
        //   }
        // } else if (response != null && response.statusCode == 500) {
        //   // errorToast(jsonDecode(response.body)["message"]);
        // }
      } else {
        print(response?.statusCode);
        print(response?.body);
        print("LOGIN FAILED..... ");
      }
    } catch (e) {
      return [];
    }
  }
}
