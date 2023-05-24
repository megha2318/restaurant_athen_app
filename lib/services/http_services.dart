import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class HttpService {
  static Future<http.Response?> getApi({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      String accessToken = PrefService.getString(PrefKeys.token);
      if (header == null && accessToken.isNotEmpty) {
        header = {
          "Content-Type": "application/json",
          "x-access-token": accessToken,
        };
      }
      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
      }
      return http.get(
        Uri.parse(url),
        headers: header,
      );
    } catch (e) {
      // showToast(e.toString());
      debugPrint("EXCEPTION : $e");
      return null;
    }
  }

  static Future<http.Response?> postApi({
    required String url,
    dynamic body,
    Map<String, String>? header,
  }) async {
    try {
      // String accessToken = PrefService.getString(PrefKeys.token);
      header ??= {
        "Accept": "application/json",
        /* "x-access-token": accessToken,*/
      };

      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
        print("Body => $body");
      }
      return http.post(
        Uri.parse(url),
        headers: header,
        body: body,
      );
    } catch (e) {
      // showToast(e.toString());
      debugPrint("=============>>>>>> ${e.toString()} <<<<<<<<=======");
      return null;
    }
  }

  static Future<http.Response?> deleteApi({
    required String url,
    Map<String, String>? header,
  }) async {
    try {
      // String accessToken = PrefService.getString(PrefKeys.token);
      header ??= {
        "Accept": "application/json",
        /* "x-access-token": accessToken,*/
      };

      if (kDebugMode) {
        print("Url => $url");
        print("Header => $header");
      }
      return http.delete(
        Uri.parse(url),
        headers: header,
      );
    } catch (e) {
      // showToast(e.toString());
      debugPrint("=============>>>>>> ${e.toString()} <<<<<<<<=======");
      return null;
    }
  }
}
