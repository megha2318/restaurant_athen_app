import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/resend_otp_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';

class ResendOtpApi {
  static Future resendOtpApi({String? email}) async {
    try {
      String url = EndPoints.resendOtp;

      Map<String, dynamic> param = {
        "email": email.toString(),
      };

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
      }, url: url, body: param);
      if (response != null && response.statusCode == 200) {
        print(response.body);
        flutterToast("Otp sent successfully");
        return resendOtpModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      return [];
    }
  }
}
