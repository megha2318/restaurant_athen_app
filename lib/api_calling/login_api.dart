import 'dart:convert';

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
        await PrefService.setValue(
            PrefKeys.token, jsonDecode(response.body)["data"]["token"]);
        await PrefService.setValue(PrefKeys.login, true);
        Get.offNamedUntil(AppRes.homePage, (route) => false);
        print(response.body);

        return loginModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
        print("LOGIN FAILED..... ");
      }
    } catch (e) {
      print(e);
    }
  }
}
