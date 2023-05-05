import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_athen_app/utils/app_textstyle.dart';

import 'date_picker_widget.dart';
import 'gestures/tap.dart';

class DateWidget extends StatefulWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color activeColor;
  final TextStyle activeDayStyle;
  final TextStyle activeDateStyle;
  final MultiSelectionListener? multiSelectionListener;
  final DateSelectionCallback? onDateSelected;
  final bool isMultiSelectionEnable;
  final String? locale;
  final bool? isBgClr;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  DateWidget({
    this.isBgClr,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.activeDateStyle,
    this.multiSelectionListener,
    required this.activeDayStyle,
    required this.activeColor,
    required this.isMultiSelectionEnable,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget>
    with AutomaticKeepAliveClientMixin {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      child: Container(
        width: widget.width,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: (widget.isBgClr == false) ? Colors.white : Color(0xff74BDCB),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Container(
          width: widget.width,
          margin: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            // color: widget.isMultiSelectionEnable == true
            //     ? isSelect == false
            //         ? Colors.white
            //         : Color(0xff74BDCB)
            //     : widget.selectionColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.date.day.toString(), // Date
                  style: widget.isMultiSelectionEnable == true
                      ? isSelect == false
                          ? widget.dateTextStyle
                          : widget.dateTextStyle
                      : widget.dateTextStyle,
                ),
                Text(DateFormat("E", widget.locale).format(widget.date),
                    // .format(widget.date)
                    // .substring(0, 1)
                    // .toUpperCase(), // WeekDay
                    style: isSelect == false
                        ? widget.dayTextStyle
                        : appTextStyle(fontSize: 11)),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (widget.isMultiSelectionEnable == true) {
          setState(() {
            isSelect = !isSelect;

            if (isSelect == true) {
              list.add(widget.date.toString());
              if (widget.onDateSelected != null) {
                // Call the onDateSelected Function
                widget.multiSelectionListener!(list);
              }
            } else {
              list.remove(widget.date.toString());
              // ignore: avoid_print
              if (widget.onDateSelected != null) {
                // Call the onDateSelected Function
                widget.multiSelectionListener!(list);
              }
            }
          });
        } else {
          // Check if onDateSelected is not null
          // isSelect = !isSelect;
          if (widget.onDateSelected != null) {
            // Call the onDateSelected Function

            widget.onDateSelected!(widget.date);
          }
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
