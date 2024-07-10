import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(ImgUtils.bgImg))
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
              onPressed: (){},
              btnText: 'Sign In',
              color: AppColor.primaryColor,
              width: 150,
              borderRadius: 26,
            ),
             const Divider(
              indent: 80,
              endIndent: 80,
              color: AppColor.greyColor,
              height: 60,
            ),
            kTextButton(
              onPressed: (){
                Get.to(()=> LoginScreen());
              },
              btnText: 'New Account',
              color: AppColor.primaryColor,
              width: 150,
              borderRadius: 26,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
