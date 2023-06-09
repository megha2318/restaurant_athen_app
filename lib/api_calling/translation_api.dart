import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';

class TranslationApi {
  static Future translationApi(String? lng) async {
    try {
      String url = EndPoints.translation;

      http.Response? response = await HttpService.getApi(
        header: {
          "Accept": "application/json",
          "Accept-Language": "$lng",
        },
        url: url,
      );
      if (response != null && response.statusCode == 200) {
        print(response.body);
        return Map<String, String>.from(json.decode(response.body));
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
