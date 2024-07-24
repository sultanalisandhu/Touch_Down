import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_check_box.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   final controller=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
                          Text('REGISTER',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColor.whiteColor),),
                          Text('You And Your Friends Always Connected',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.whiteColor),),
                        ],
                      ),
                    ),
                    6.height,
                    Text('User Name',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      hintText: 'Your User Name',
                      controller: controller.emailController,
                      obSecureText: false,
                      context: context,
                    ),
                    2.height,
                    Text('Enter Password',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      controller: controller.passwordController,
                      hintText: '*******',
                      obSecureText: controller.showPassword.value,
                      suffixIcon: controller.showPassword.value?Icons.visibility:Icons.visibility_off,
                      suffixOnTap: (){
                        controller.togglePassword();
                      },
                      context: context,
                    ),
                    2.height,
                    Text('Enter Your Phone Number',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      controller: controller.phoneNumberController,
                      hintText: '09876543211',
                      obSecureText: false,
                      context: context,
                    ),
                    2.height,
                    Text('Enter Your Location',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      controller: controller.locationController,
                      hintText: 'Bengaluru',
                      obSecureText: false,
                      context: context,
                    ),
                    1.height,
                    CustomCheckbox(),
                    6.height,
                    Align(
                      alignment: Alignment.center,
                      child: kTextButton(
                        onPressed: (){
                          Get.to(()=> CustomBottomBar());
                        },
                        btnText: 'SIGN UP',
                        textColor: AppColor.blackColor,
                        color: AppColor.primaryColor,
                        height: 5.h,
                        width: 50.w,
                        borderRadius: 26.h,

                      ),
                    ),
                    2.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        showSvgIconWidget(onTap: (){}, iconPath: IconUtils.fbIcon,height: 40,width: 40),
                        4.width,
                        showSvgIconWidget(onTap: (){}, iconPath: IconUtils.googleIcon,height: 40,width: 40),
                      ],
                    ),
                    4.height,
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('FORGOT PASSWORD ?',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                            Text('Don\'t have an account ? Sign up here',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                          ],
                        )),

                  ],
                ).paddingSymmetric(horizontal: 30,vertical: 20),
              )
          )
        ],
      ),
    );
  }
}
