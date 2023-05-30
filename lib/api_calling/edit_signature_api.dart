import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/common/popup.dart';
import 'package:restaurant_athen_app/models/edit_signature_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class EditSignatureApi {
  static Future editSignatureApi({
    var id,
    String? signature,
  }) async {
    try {
      String url = "${EndPoints.baseUrl}/signatures/$id?_method=PUT";

      Map<String, String> param = {
        "signature": signature.toString(),
      };
      //
      // http.Response? response = await HttpService.postApi(header: {
      //   "Accept": "application/json",
      //   "Params": "_method/PUT",
      //   "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      // }, url: url, body: param);

      Map<String, String> headers = {
        "Accept": "application/json",
        "Params": "_method/PUT",
        // 'Content-Type': 'multipart/form-data',
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      };
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(param)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', signature!));

      var responsed = await request.send();
      var response = await http.Response.fromStream(responsed);

      if (response != null && response.statusCode == 200) {
        print(response.body);

        flutterToast(jsonDecode(response.body)['message']);
        return editSignatureModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        if (response != null) {
          errorToast(jsonDecode(response.body)['message']);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
