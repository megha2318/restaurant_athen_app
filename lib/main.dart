import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_athen_app/screens/done_screen/done.dart';
import 'package:restaurant_athen_app/screens/forgot_password_screen/forgot_password.dart';
import 'package:restaurant_athen_app/screens/home_screen/home.dart';
import 'package:restaurant_athen_app/screens/login_screen/login.dart';
import 'package:restaurant_athen_app/screens/reset_password_screen/reset_password.dart';
import 'package:restaurant_athen_app/screens/signup_screen/signup.dart';
import 'package:restaurant_athen_app/screens/splash_screen/splash.dart';
import 'package:restaurant_athen_app/screens/verification_screen/verification.dart';
import 'package:restaurant_athen_app/utils/app_res.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(name: AppRes.splashPage, page: () => SplashScreen()),
        GetPage(name: AppRes.loginPage, page: () => LoginScreen()),
        GetPage(
            name: AppRes.forgotPasswordPage,
            page: () => ForgotPasswordScreen()),
        GetPage(
            name: AppRes.verificationPage, page: () => VerificationScreen()),
        GetPage(
            name: AppRes.resetPasswordPage, page: () => ResetPasswordScreen()),
        GetPage(name: AppRes.donePage, page: () => DoneScreen()),
        GetPage(name: AppRes.signupPage, page: () => SignupScreen()),
        GetPage(name: AppRes.homePage, page: () => HomeScreen()),
      ],
    ),
  );
}
