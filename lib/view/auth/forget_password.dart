import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
        alignment: Alignment.center,
        children: [
           const BackgroundImage(imgPath: ImgUtils.bgImg2, ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Image(
                  image: AssetImage(ImgUtils.logo),
                  fit: BoxFit.cover,
                ),
                2.height,
                Text(
                  'FORGOT PASSWORD',
                  style: primaryTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor),
                ),
                Text(
                  'Enter your email to reset password',
                  style: primaryTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.whiteColor),
                ),
                4.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.lightGreyColor),
                    )),
                KTextField(
                  controller: controller.emailController,
                  obSecureText: false,
                  hintText: 'Your email',
                  context: context,
                  keyboardType: TextInputType.emailAddress,
                ),
                6.height,
                controller.isLoading
                    ?kCircularLoading()
                    :kTextButton(
                  onPressed: () {
                    if (controller.emailController.text.isEmpty) {
                      showSnackBar('Error', 'Enter email address',
                          isError: true);
                    } else if (!controller.isValidEmail(controller.emailController.text)) {
                      showSnackBar('Error', 'Enter a valid email address',
                          isError: true);
                    } else {
                      controller.forgotPassword();
                    }
                  },
                  btnText: 'SEND CODE',
                  textColor: AppColor.blackColor,
                  color: AppColor.primaryColor,
                  height: 5.h,
                  width: 50.w,
                  borderRadius: 26,
                ),
                const Spacer(),
              ],
            ).paddingSymmetric(horizontal: 4.w),
          ),
        ],
      ),
    );
  }
}