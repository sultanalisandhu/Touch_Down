import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/view/auth/select_role.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImgUtils.bgImg), context);
    return Container(
      alignment: Alignment.center,
      height: mQ.height,
      width: mQ.width,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(ImgUtils.bgImg), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(ImgUtils.logo),
            fit: BoxFit.cover,
          ),
          Text(
            'WELCOME',
            style: primaryTextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor,
            ),
          ),
          5.height,
          kTextButton(
            onPressed: () {
              Get.offAll(() => LoginScreen());
            },
            btnText: 'SIGN IN',
            color: AppColor.primaryColor,
            textColor: AppColor.blackColor,
            width: 50.w,
          ),
          Divider(
            indent: 7.h,
            endIndent: 7.h,
            color: AppColor.greyColor,
            height: 5.h,
          ),
          kTextButton(
            onPressed: () {
              Get.offAll(() => SelectRole());
            },
            textColor: AppColor.blackColor,
            btnText: 'NEW ACCOUNT',
            color: AppColor.primaryColor,
            width: 50.w,
          ),
        ],
      ),
    );
  }
}