import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/forget_password.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final AuthController controller= Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(imgPath: ImgUtils.bgImg,),
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
                     child: Text('Email',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
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
                controller.isLoading
                    ?kCircularLoading()
                    :kTextButton(
                  onPressed: (){
                    if(controller.emailController.text.isEmpty){
                      showSnackBar('Error', 'Enter email address',isError: true);
                    }else if(controller.passwordController.text.isEmpty){
                      showSnackBar('Error', 'Enter password',isError: true);
                    }else if(!controller.isValidEmail(controller.emailController.text)){
                      showSnackBar('Error', 'Enter a valid email address',isError: true);
                    }else if(!controller.isValidPassword(controller.passwordController.text)){
                      showSnackBar('Error', 'Password must be at least 8 characters long.',isError: true);
                    }else{
                      controller.logIn();
                    }
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
                GestureDetector(
                    onTap: (){
                      Get.to(()=> ForgotPasswordScreen());
                    },
                    child: Text('FORGOT PASSWORD ?',style: primaryTextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: AppColor.lightGreyColor),)),
                1.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? ',style: primaryTextStyle(fontSize: 9.0,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    GestureDetector(
                        onTap: (){
                          Get.offAll(()=> RegisterScreen());
                        },
                        child: Text('Sign up here',style: primaryTextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: AppColor.lightGreyColor),)),
                  ],
                ),
                2.height,
              ],
            ).paddingSymmetric(horizontal: 4.w)
          )
        ],
      ),
    );
  }
}
