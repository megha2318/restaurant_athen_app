import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/models/otp_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';

class OtpApi {
  static Future otpApi({String? email, String? otp}) async {
    try {
      String url = EndPoints.otp;

      Map<String, dynamic> param = {
        "email": email.toString(),
        "otp": otp?.toString(),
      };

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
      }, url: url, body: param);
      if (response != null && response.statusCode == 200) {
        print(response.body);
        Get.toNamed(AppRes.resetPasswordPage);

        return otpModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      return [];
    }
  }
}
