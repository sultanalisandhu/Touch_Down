import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_otp_textfield.dart';

class OtpScreen extends StatelessWidget {
  final String email;
   OtpScreen({super.key, required this.email});
  final AuthController controller= Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Stack(
        alignment: Alignment.center,
        children: [
          const BackgroundImage(imgPath: ImgUtils.bgImg,),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    5.height,
                     const Align(
                      alignment: Alignment.center,
                      child:  Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
                    ),
                    3.height,
                    Text('Enter OTP:',style: primaryTextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    1.height,
                     PinCodeFields(controller: controller,),
                    2.height,
                    Row(
                      children: [
                        Text('Didn’t receive OTP? ',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                        GestureDetector(
                            onTap: (){
                              controller.resendOtp();
                            },
                            child: Text('Resend OTP',style: primaryTextStyle(textDecoration: TextDecoration.underline, fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),)),
                      ],
                        // 2bd3bp812p@hellomailo.net
                        // 2bd3bp812@hellomailo.net
                    ),
                    6.height,
                    Align(
                      alignment: Alignment.center,
                      child: controller.isLoading
                          ? kCircularLoading()
                          : kTextButton(
                        onPressed: (){
                          controller.verifyOtp(email);
                          debugPrint('otp email ${controller.emailController.text.trim()}');
                          debugPrint('otp email received ${email}');
                        },
                        btnText: 'LOG IN',
                        textColor: AppColor.blackColor,
                        color: AppColor.primaryColor,
                        width: 200,
                        borderRadius: 26,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 30,vertical: 20),
              )
          )
        ],
      ),
    );
  }
}
