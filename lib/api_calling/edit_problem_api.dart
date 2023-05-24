import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/edit_problem_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class EditProblemApi {
  static Future editProblemApi({
    String? reason,
    String? image,
  }) async {
    try {
      String url = EndPoints.editProblem;

      Map<String, String> param = {
        "reason": reason.toString(),
        "image": image.toString(),
      };
      Map<String, String> headers = {
        "Accept": "application/json",
        "Params": "_method/PUT",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      };

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(param)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', image!));

      var responsed = await request.send();
      var response = await http.Response.fromStream(responsed);

      // http.Response? response = await HttpService.postApi(header: {
      //   "Accept": "application/json",
      //   "Params": "_method/PUT",
      //   "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      // }, url: url, body: param);
      if (response.statusCode == 200) {
        print(response.body);

        flutterToast(jsonDecode(response.body)['message']);
        return editProblemModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        errorToast(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      print(e);
    }
  }
}
