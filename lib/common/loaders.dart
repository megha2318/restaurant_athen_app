import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color_res.dart';

class SmartLoader extends StatelessWidget {
  const SmartLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                color: ColorRes.color74BDCB,
              )
            : const CircularProgressIndicator(
                color: ColorRes.color74BDCB,
              ),
      ),
    );
  }
}

class SmallLoader extends StatelessWidget {
  const SmallLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: ColorRes.color74BDCB,
            )
          : const CircularProgressIndicator(
              color: ColorRes.color74BDCB,
            ),
    );
  }
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator(
                color: ColorRes.color74BDCB,
              )
            : const CircularProgressIndicator(
                color: ColorRes.color74BDCB,
              ),
      ),
    );
  }
}
