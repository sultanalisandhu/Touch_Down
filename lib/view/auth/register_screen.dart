import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/otp_screen.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_check_box.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class RegisterScreen extends StatelessWidget {
   const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        Text('REGISTER',style: primaryTextStyle(fontSize: 38,fontWeight: FontWeight.w700,color: AppColor.whiteColor),),
                        Text('You And Your Friends Always Connected',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColor.whiteColor),),
                      ],
                    ),
                  ),
                  60.height,
                  Text('Email:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                  KTextField(
                    context: context,
                  ),
                  20.height,
                  Text('Password:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                  KTextField(
                    context: context,
                  ),
                  20.height,
                  Text('Confirm Password:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                  KTextField(
                    context: context,
                  ),
                  20.height,
                  Text('Enter Your Location:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                  KTextField(
                    context: context,
                  ),
                  10.height,
                  CustomCheckbox(),
                  60.height,
                  Align(
                    alignment: Alignment.center,
                    child: kTextButton(
                      onPressed: (){
                        Get.to(()=> OtpScreen());
                      },
                      btnText: 'SIGN IN',
                      color: AppColor.primaryColor,
                      width: 200,
                      borderRadius: 26,
              
                    ),
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
                  60.height,
                  Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('FORGOT PASSWORD ?',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                          Text('Don\'t have an account ? Sign up here',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                        ],
                      )),

                ],
              ).paddingSymmetric(horizontal: 30,vertical: 20),
            )
        )
      ],
    );
  }
}
