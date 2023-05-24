import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/models/edit_profile_model.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class EditProfileApi {
  static Future editProfileApi({
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phoneNumber,
    String? address,
    String? zipcode,
    String? cityId,
    String? cityName,
    String? joinDate,
    String? employeeNumber,
    String? amountOfVacationDays,
    String? amountOfHoursWork,
    File? profile,
  }) async {
    try {
      String url = EndPoints.editProfile;

      Map<String, String> param = {
        "first_name": firstName.toString(),
        "last_name": lastName.toString(),
        "username": userName.toString(),
        "email": email.toString(),
        "phone_number": phoneNumber.toString(),
        "address": address.toString(),
        "zipcode": zipcode.toString(),
        "city_name": cityId.toString(),
        "join_date": joinDate.toString(),
        "employee_number": employeeNumber.toString(),
        "amount_of_vacation_days": amountOfVacationDays.toString(),
        "amount_of_hours_work": amountOfHoursWork.toString(),
        "profile": profile!.path.toString(),
      };

      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
      };

      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields.addAll(param)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath(
            'profile', profile.path.toString()));
      var response = await request.send();

      var responsed = await http.Response.fromStream(response);

      // http.Response? response = await HttpService.postApi(, url: url, body: param);
      if (responsed != null && responsed.statusCode == 200) {
        print(responsed.body);
        // flutterToast(jsonDecode(responsed.body)['message']);

        return editProfileModelFromJson(responsed.body);
      } else {
        print(responsed.statusCode);
        print(responsed.body);
      }
    } catch (e) {
      print(
          "========================================= MSG =============================================");
      print(e);
    }
  }
}
