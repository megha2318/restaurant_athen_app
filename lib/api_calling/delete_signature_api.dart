import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class DeleteSignatureApi {
  static Future deleteSignatureApi() async {
    try {
      String url =
          "${EndPoints.deleteSignature}${PrefService.getInt("signatureId").toString()}";

      http.Response? response = await HttpService.deleteApi(
        header: {
          "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
        },
        url: url,
      );
      if (response != null && response.statusCode == 200) {
        print(response.body);
        flutterToast(jsonDecode(response.body)['message']);

        return response.body;
      } else {
        if (response != null) {
          errorToast(jsonDecode(response.body)['message']);
        }
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
