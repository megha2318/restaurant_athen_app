import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class LogoutApi {
  static Future logoutApi() async {
    try {
      String url = EndPoints.logOut;

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      }, url: url);
      if (response != null && response.statusCode == 200) {
        print("logout.....");
        print(response.body);

        return response.body;
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
