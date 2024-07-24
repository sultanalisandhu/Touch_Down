import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final controller= Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Stack(
        alignment: Alignment.center,
        children: [
         const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
                 2.height,
                 Text('LOG IN!',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColor.whiteColor),),
                 Text('Happy To See You Again!',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.whiteColor),),
                 4.height,
                 Align(
                     alignment: Alignment.topLeft,
                     child: Text('User Name',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
                KTextField(
                  controller: controller.emailController,
                  obSecureText: false,
                  hintText: 'Your user name',
                  context: context,
                  keyboardType: TextInputType.emailAddress,
                ),
                2.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Password:',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
               KTextField(
                    controller: controller.passwordController,
                    hintText: '*********',
                    suffixIcon: controller.showPassword.value? Icons.visibility: Icons.visibility_off,
                    obSecureText: controller.showPassword.value,
                    suffixOnTap: (){
                      controller.togglePassword();
                    },
                    context: context,
                  ),
                6.height,
                kTextButton(
                  onPressed: (){
                    Get.to(()=> RegisterScreen());
                  },
                  btnText: 'SIGN IN',
                  textColor: AppColor.blackColor,
                  color: AppColor.primaryColor,
                  height: 5.h,
                  width: 50.w,
                  borderRadius: 26,

                ),
                2.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showSvgIconWidget(onTap: (){}, iconPath: IconUtils.fbIcon,height: 40,width: 40),
                    3.width,
                    showSvgIconWidget(onTap: (){}, iconPath: IconUtils.googleIcon,height: 40,width: 40),
                  ],
                ),
                const Spacer(),
                Text('FORGOT PASSWORD ?',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                1.height,
                Text('Don\'t have an account ? Sign up here',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                2.height,
              ],
            ).paddingSymmetric(horizontal: 20)
          )
        ],
      ),
    );
  }
}
