import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final AuthController controller = Get.find<AuthController>(tag: 'loginController');

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(imgPath: ImgUtils.bgImg2),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(ImgUtils.logo),
                    fit: BoxFit.cover,
                  ),
                  2.height,
                  _buildTitleText('FORGOT PASSWORD'),
                  _buildSubtitleText('Enter your email to reset password'),
                  4.height,
                  _buildLabelText('Email'),
                  KTextField(
                    controller: controller.emailController,
                    obSecureText: false,
                    hintText: 'Your email',
                    context: context,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  6.height,
                  controller.isLoading
                      ? kCircularLoading()
                      : kTextButton(
                    onPressed: () {
                      _handleForgotPassword();
                    },
                    btnText: 'SEND CODE',
                    width: 60.w,
                  ),
                ],
              ).paddingSymmetric(horizontal: 4.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: primaryTextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColor.whiteColor,
      ),
    );
  }

  Widget _buildSubtitleText(String text) {
    return Text(
      text,
      style: primaryTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColor.whiteColor,
      ),
    );
  }

  Widget _buildLabelText(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: primaryTextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColor.lightGreyColor,
        ),
      ),
    );
  }

  void _handleForgotPassword() {
    final email = controller.emailController.text;
    if (email.isEmpty) {
      showSnackBar('Error', 'Enter email address', isError: true);
    } else if (!controller.isValidEmail(email)) {
      showSnackBar('Error', 'Enter a valid email address', isError: true);
    } else {
      controller.forgotPassword();
    }
  }
}

// !controller.isValidEmail(controller.emailController.text)