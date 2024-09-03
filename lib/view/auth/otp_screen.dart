import 'package:flutter/gestures.dart';
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
import 'package:touch_down/widgets/custom_text_fields/k_otp_textfield.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  const OtpScreen({super.key, required this.email});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(AuthController()),
      builder: (controller) {
        return Stack(
            alignment: Alignment.center,
            children: [
              const BackgroundImage(imgPath: ImgUtils.bgImg,),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Center(
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
                          Obx(()=>RichText(
                              text:  TextSpan(
                                text: 'Did\'nt receive OTP? ',
                                style: primaryTextStyle(fontSize: 10.0,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),
                                children: <TextSpan>[
                                  TextSpan(text:
                              controller.isLoading
                                  ? 'Resending...'
                                  : 'Resend OTP',
                                      style: primaryTextStyle(fontSize: 11,fontWeight: FontWeight.w600,
                                      color: AppColor.lightGreyColor),
                                      recognizer: TapGestureRecognizer()..onTap=(){
                                        controller.resendOtp(email);
                                      }
                                  )
                                ],
                              ),
                            ),
                          ),
                          6.height,
                          Obx(()=>Align(
                              alignment: Alignment.center,
                              child: controller.isLoading
                                  ? kCircularLoading()
                                  : kTextButton(
                                onPressed: () async {
                                  controller.verifyOtp(email);
                                  debugPrint('otp email ${controller.emailController.text.trim()}');
                                  debugPrint('otp email received ${email}');
                                },
                                btnText: 'LOG IN',
                                width: 60.w,
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 30,vertical: 20),
                    ),
                  )
              )
            ],
          );
      }
    );
  }
}
