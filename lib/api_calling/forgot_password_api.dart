import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/models/forgot_password_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';

class ForgotPasswordApi {
  static Future forgotPasswordApi({
    String? email,
  }) async {
    try {
      String url = EndPoints.forgotPassword;

      Map<String, dynamic> param = {
        "email": email.toString(),
      };

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
      }, url: url, body: param);
      if (response != null && response.statusCode == 200) {
        print(response.body);
        Get.toNamed(AppRes.verificationPage);

        PrefService.setValue(
            "email", jsonDecode(response.body)['employee']['email'].toString());
        return forgotPasswordModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      return [];
    }
  }
}
