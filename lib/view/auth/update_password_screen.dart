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
import 'package:touch_down/widgets/custom_text_fields/k_otp_textfield.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final AuthController controller = Get.find<AuthController>(tag: 'loginController');

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(imgPath: ImgUtils.bgImg2,),
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
                  'RESET PASSWORD',
                  style: primaryTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor),
                ),
                Text(
                  'Enter your details to reset your password',
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
                2.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Verification Code',
                      style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.lightGreyColor),
                    )),
                2.height,
                 UpdatePinCodeFields(controller: controller,),
                2.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'New Password',
                      style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColor.lightGreyColor),
                    )),
                KTextField(
                  controller: controller.newPasswordController,
                  suffixIcon: controller.showPassword.value? Icons.visibility: Icons.visibility_off,
                  obSecureText: controller.showPassword.value,
                  suffixOnTap: (){
                    controller.togglePassword();
                  },
                  hintText: 'Your new password',
                  context: context,
                ),
                6.height,
                controller.isLoading
                    ?kCircularLoading()
                    :kTextButton(
                  onPressed: () {
                    if (controller.emailController.text.isEmpty) {
                      showSnackBar('Error', 'Enter your email address', isError: true);
                    } else if (controller.updatedPinController.text.isEmpty) {
                      showSnackBar('Error', 'Enter the verification code', isError: true);
                    } else if (controller.newPasswordController.text.isEmpty) {
                      showSnackBar('Error', 'Enter a new password', isError: true);
                    } else if (!controller.isValidPassword(controller.newPasswordController.text)) {
                      showSnackBar('Error', 'Password must be at least 8 characters long.',isError: true);
                    }else{
                      printWarning('text${controller.newPasswordController.text}');
                      controller.updatePassword();
                    }
                  },
                  btnText: 'RESET PASSWORD',
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