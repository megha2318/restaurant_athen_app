import 'package:http/http.dart' as http;
import 'package:restaurant_athen_app/models/task_list_model.dart';
import 'package:restaurant_athen_app/services/http_services.dart';
import 'package:restaurant_athen_app/services/pref_services.dart';
import 'package:restaurant_athen_app/utils/end_points.dart';
import 'package:restaurant_athen_app/utils/pref_keys.dart';

class TaskListApi {
  static Future taskListApi() async {
    try {
      String url = EndPoints.taskList;

      http.Response? response = await HttpService.getApi(
        header: {
          "Accept": "application/json",
          "Authorization": "Bearer ${PrefService.getString(PrefKeys.token)}",
        },
        url: url,
      );
      if (response != null && response.statusCode == 200) {
        print(response.body);
        return taskListModelFromJson(response.body);
      } else {
        print(response?.statusCode);
        print(response?.body);
      }
    } catch (e) {
      return [];
    }
  }
}
