import 'package:flutter/material.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';

Widget halfCircle() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const SizedBox(
        width: 500,
      ),
      Container(
        alignment: Alignment.topRight,
        height: 250,
        width: 250,
        child: Image.asset(
          AssetRes.halfCircleImg,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}
