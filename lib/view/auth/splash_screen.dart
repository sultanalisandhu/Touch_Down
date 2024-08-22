import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/controller/geo_location_controller.dart';
import 'package:touch_down/controller/splash_controller.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashController splashController=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    splashController.navigateTo();
    precacheImage(const AssetImage(ImgUtils.bgImg), context);
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
          child: Image.asset(
            ImgUtils.logo,
            width: 500,
            height: 500,
          )),
    );
  }
}
