import 'package:calender_picker/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:restaurant_athen_app/common/appbar.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: Padding(
        padding:
            EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05),
        child: Column(
          children: [
            appBarHome(title: 'Deine Einsätze'),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  'Scheduled Workout',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
                InkWell(
                  onTap: () async{
                    final selected = await showMonthYearPicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2023),
                    );

                    print(selected?.month);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: ColorRes.lightRedClr, shape: BoxShape.circle),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          AssetRes.calenderIcon,
                          color: ColorRes.black,
                        ),
                      )),
                )
              ],
            ),
            Container(
              child: CalenderPicker(
                DateTime.now(),
                width: 40,
                height: 80,
                enableMultiSelection: false,
                initialSelectedDate: DateTime.now(),
                selectionColor: ColorRes.color74BDCB,
                selectedTextColor: ColorRes.black,
                monthTextStyle: appTextStyle(),
                dayTextStyle:
                    appTextStyle(fontSize: 8, color: ColorRes.greyClr),
                dateTextStyle: appTextStyle(fontSize: 14),
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  different({DateTime? first, DateTime? last}) async {
    int data = last!.difference(first!).inDays;
    // ignore: avoid_print

    setState(() {
      data++;
      // days = data;
      // ignore: avoid_print
      print(data);
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        // dateTime = args.value.startDate;

        if (args.value.endDate != null) {
          different(first: args.value.startDate, last: args.value.endDate);
          // ignore: avoid_print
          print(args.value.startDate);
          // ignore: avoid_print
          print(args.value.endDate);
        }
      });
    }
  }
}
