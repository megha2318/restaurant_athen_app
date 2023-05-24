import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/add_problem_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class AddProblemApi {
  static Future addProblemApi({
    String? objectId,
    String? reason,
    File? image,
  }) async {
    try {
      String url = EndPoints.problem;

      Map<String, String> param = {
        "object_id": objectId.toString(),
        "reason": reason.toString(),
        "image": image!.path,
      };

      Map<String, String> headers = {
        "Accept": "application/json",
        // 'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      };
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(param)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', image.path));

      var responsed = await request.send();
      var response = await http.Response.fromStream(responsed);

      // http.Response? response = await HttpService.postApi(header: {
      //   "Accept": "application/json",
      //   // 'Content-Type': 'multipart/form-data',
      //   "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      // }, url: url, body: param);
      //
      if (response.statusCode == 200) {
        print(response.body);

        flutterToast(jsonDecode(response.body)['message']);

        return addProblemModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        if (response != null) {
          errorToast(jsonDecode(response.body)['message']);
        }
      }
    } catch (e) {
      print(
          "================================ MSG =========================================================");
      print(e);
    }
  }
}
