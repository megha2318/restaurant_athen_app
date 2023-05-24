import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/api_calling/dashboard_obj_api.dart';
import 'package:restaurant_athen_app/models/dashboard_obj_model.dart';
import 'package:restaurant_athen_app/models/single_obj_model.dart';
import 'package:restaurant_athen_app/models/task_list_model.dart';
import 'package:restaurant_athen_app/models/work_list_model.dart';

class HomeController extends GetxController {
  RxInt getMonth = DateTime.now().month.obs;
  RxInt getYear = DateTime.now().year.obs;
  Rx<TextEditingController> searchCon = TextEditingController().obs;

  void calenderOnTap() {}
  RxBool isSearch = false.obs;
  RxBool searchIcon = false.obs;

  onTapSearchIcon() {
    if (searchIcon.value == true) {
      searchIcon.value = false;
    } else {
      searchIcon.value = true;
    }
  }

  onAddTap() {
    if (isSearch.value == true) {
      isSearch.value = false;
    } else {
      isSearch.value = true;
    }
  }

  RxString getDate = DateTime.now().toString().split(' ')[0].split('-')[2].obs;
  RxString month = (DateTime.now().month == 1)
      ? "January".obs
      : (DateTime.now().month == 2)
          ? "February".obs
          : (DateTime.now().month == 3)
              ? "March".obs
              : (DateTime.now().month == 4)
                  ? "April".obs
                  : (DateTime.now().month == 5)
                      ? "May".obs
                      : (DateTime.now().month == 6)
                          ? "June".obs
                          : (DateTime.now().month == 7)
                              ? "July".obs
                              : (DateTime.now().month == 8)
                                  ? "August".obs
                                  : (DateTime.now().month == 9)
                                      ? "September".obs
                                      : (DateTime.now().month == 10)
                                          ? "October".obs
                                          : (DateTime.now().month == 11)
                                              ? "November".obs
                                              : "December".obs;

  Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December",
  };

  RxInt? monthInWord;
  RxBool loader = false.obs;
  Rx<DashboardObjModel> dashboardObjModel = DashboardObjModel().obs;
  Rx<WorkListModel> workListModel = WorkListModel().obs;
  Rx<TaskListModel> taskListModel = TaskListModel().obs;
  Rx<SingleObjModel> singleObjModel = SingleObjModel().obs;

  @override
  void onInit() async {
    super.onInit();

    dashboardObjModel.value = await DashboardObjApi.dashboardObjApi();

    print(dashboardObjModel.value);
  }
}
