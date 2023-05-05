import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/splash_screen/splash_controller.dart';
import 'package:restaurant_athen_app/utils/asset_res.dart';
import 'package:restaurant_athen_app/utils/color_res.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

final  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Image.asset(
                  AssetRes.twoCircleBgImg,
                  fit: BoxFit.cover,
                ),
              ),
              Transform.scale(
                scale: 0.5,
                child: Image.asset(
                  AssetRes.logoImg,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
