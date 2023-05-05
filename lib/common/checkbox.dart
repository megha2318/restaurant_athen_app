import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

Widget checkbox({
  required bool checkBoxVal,
  required void Function(bool?)? onChanged,
}) {
  return Container(
    height: 16,
    width: 16,
    margin: EdgeInsets.only(left: 5, right: Get.width * 0.02),
    decoration: BoxDecoration(
        color: ColorRes.white, borderRadius: BorderRadius.circular(5)),
    child: Checkbox(
        fillColor: MaterialStateColor.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return ColorRes.color74BDCB;
            }
            return ColorRes.white;
          },
        ),
        checkColor: ColorRes.color74BDCB, // color of tick Mark
        activeColor: ColorRes.white,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        tristate: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(
            style: BorderStyle.solid, color: ColorRes.color74BDCB),
        value: checkBoxVal,
        onChanged: onChanged),
  );
}
