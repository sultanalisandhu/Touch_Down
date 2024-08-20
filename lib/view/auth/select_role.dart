import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/widgets/auth_widgets/auth_widget.dart';
import 'package:touch_down/widgets/k_bg_img.dart';

import 'coach_registration_screens/coach_registration1.dart';

class SelectRole extends StatelessWidget {
  SelectRole({super.key});

  // Variable to hold the selected role
  final RxString selectedRole = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BackgroundImage(imgPath: ImgUtils.bgImg),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(ImgUtils.logo),
                    fit: BoxFit.cover,
                  ),
                  3.height,
                  Text(
                    'REGISTER',
                    style: primaryTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  Text(
                    'You And Your Friends Always Connected',
                    style: primaryTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  2.height,
                  roleContainer(
                    onTap: () {
                      selectedRole.value = 'customer';
                      Get.offAll(()=>RegisterScreen(userRole: selectedRole.value));
                    },
                    title: 'SIGN UP AS CUSTOMER',
                    iconPath: IconUtils.profileIcon,
                  ),
                  roleContainer(
                    onTap: () {
                      selectedRole.value = 'agency';
                      print('Selected Role: ${selectedRole.value}');
                    },
                    title: 'SIGN UP AS AGENCY',
                    iconPath: IconUtils.agencyIcon,
                  ),
                  roleContainer(
                    onTap: () {
                      selectedRole.value = 'coach';
                      print('Selected Role: ${selectedRole.value}');

                      Get.offAll(() => CoachRegistration1(selectedRole: selectedRole.value));
                    },
                    title: 'SIGN UP AS COACH',
                    iconPath: IconUtils.coachIcon,
                  ),
                ],
              ).paddingSymmetric(horizontal: 30, vertical: 20),
            ),
          ),
        ),
      ],
    );
  }
}
