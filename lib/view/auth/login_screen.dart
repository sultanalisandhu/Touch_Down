import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                 20.height,
                 Text('LOG IN!',style: primaryTextStyle(fontSize: 38,fontWeight: FontWeight.w700,color: AppColor.whiteColor),),
                 Text('Happy To See You Again!',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColor.whiteColor),),
                 40.height,
                 Align(
                     alignment: Alignment.topLeft,
                     child: Text('User Name',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
                KTextField(
                  controller: controller.emailController,
                  obSecureText: false,
                  hintText: 'Your User Name',
                  context: context,
                  keyboardType: TextInputType.emailAddress,
                ),
                20.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Password:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
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
                60.height,
                kTextButton(
                  onPressed: (){
                    Get.to(()=> RegisterScreen());
                  },
                  btnText: 'SIGN IN',
                  color: AppColor.primaryColor,
                  width: 200,
                  borderRadius: 26,

                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showSvgIconWidget(onTap: (){}, iconPath: IconUtils.fbIcon,height: 40,width: 40),
                    20.width,
                    showSvgIconWidget(onTap: (){}, iconPath: IconUtils.googleIcon,height: 40,width: 40),
                  ],
                ),
                const Spacer(),
                Text('FORGOT PASSWORD ?',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                10.height,
                Text('Don\'t have an account ? Sign up here',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                20.height,
              ],
            ).paddingSymmetric(horizontal: 20)
          )
        ],
      ),
    );
  }
}
