import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/add_signature_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class AddSignatureApi {
  static Future addSignatureApi({
    String? signature,
    String? objectId,
  }) async {
    try {
      String url = EndPoints.signature;

      Map<String, dynamic> param = {
        "signature": signature,
        "object_id": objectId.toString(),
      };

      http.Response? response = await HttpService.postApi(header: {
        "Accept": "application/json",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      }, url: url, body: param);
      if (response != null && response.statusCode == 200) {
        print(response.body);

        flutterToast(jsonDecode(response.body)['message']);

        return addSignatureModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
        if (response != null) {
          errorToast(jsonDecode(response.body)['message']);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
