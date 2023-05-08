import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';

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
        "Content-Type": "application/json",
      }, url: url, body: jsonEncode(param));
      if (response != null && response.statusCode == 200) {
        //   bool? status = jsonDecode(response.body)["status"];
        //   if (status == false) {
        //     // errorToast(jsonDecode(response.body)["message"]);
        //   } else if (status == true) {
        //     // flutterToast(jsonDecode(response.body)["message"]);
        //     // await PrefService.setValue(
        //     //     PrefKeys.token, jsonDecode(response.body)["token"]);
        //     /// login complete...
        //     // await PrefService.setValue(
        //     //     PrefKeys.token, jsonDecode(response.body)["token"]);
        //     // await PrefService.setValue(
        //     //     PrefKeys.loginId, jsonDecode(response.body)["data"]["id"]);
        //     // await PrefService.setValue(PrefKeys.register, true);
        //     // Get.toNamed(AppRes.dashBoardScreen);
        //     // return socialLoginModelFromJson(response.body);
        //   }
        // } else if (response != null && response.statusCode == 500) {
        //   // errorToast(jsonDecode(response.body)["message"]);
        // }
        print(response.body);
        // Get.offNamedUntil(AppRes.homePage, (route) => false);

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
