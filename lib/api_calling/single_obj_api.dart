import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/single_obj_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class SingleObjApi {
  static Future singleObjApi() async {
    try {
      String url = "${EndPoints.singleObj}"
          // "${PrefService.getInt("objectId")}"
          "7";

      http.Response? response = await HttpService.getApi(header: {
        "Accept": "application/json",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      }, url: url);
      if (response != null && response.statusCode == 200) {
        print(response.body);

        return singleObjModelFromJson(response.body);
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
