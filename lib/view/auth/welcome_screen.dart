import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(ImgUtils.bgImg), context);
    return Scaffold(
      body: Container(
        height: mQ.height,
        width: mQ.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImgUtils.bgImg),fit: BoxFit.cover)
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3,),
            const Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
            const Text('WELCOME',style: TextStyle(fontSize: 38,fontWeight: FontWeight.w900,color: AppColor.whiteColor),),
            const Spacer(),
            kTextButton(
              onPressed: (){
                Get.to(()=> LoginScreen());
              },
              btnText: 'SIGN IN',
              color: AppColor.primaryColor,
              textColor: AppColor.blackColor,
              fontSize: 10,
              height: 5.h,
              width: 50.w,
              borderRadius: 26.h,
            ),
             Divider(
              indent: 8.h,
              endIndent: 8.h,
              color: AppColor.greyColor,
              height: 8.h,
            ),
            kTextButton(
              onPressed: (){
                Get.to(()=> RegisterScreen());
              },
              textColor: AppColor.blackColor,
              btnText: 'NEW ACCOUNT',
              color: AppColor.primaryColor,
              fontSize: 10,
              height: 5.h,
              width: 50.w,
              borderRadius: 26.h,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
