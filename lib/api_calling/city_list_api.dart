import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class CityListApi {
  static Future cityListApi() async {
    try {
      String url = EndPoints.cityList;

      http.Response? response = await HttpService.getApi(
        header: {
          "Accept": "application/json",
          "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
        },
        url: url,
      );
      if (response != null && response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)['object'];
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      print(
          "========================================= MSG =============================================");
      print(e);
    }
  }
}
