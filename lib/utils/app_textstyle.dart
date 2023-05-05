import 'package:flutter/material.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

TextStyle appTextStyle({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
      fontFamily: 'OpenSans',
      fontSize: fontSize ?? 40,
      color: color ?? ColorRes.black,
      fontWeight: fontWeight ?? FontWeight.w700);
}

TextStyle appTextStyleSemiBold({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
      fontFamily: 'OpenSansSemi',
      fontSize: fontSize ?? 40,
      color: color ?? ColorRes.black,
      fontWeight: fontWeight ?? FontWeight.w700);
}
