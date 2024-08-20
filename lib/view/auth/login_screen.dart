import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/forget_password.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/view/auth/select_role.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final AuthController loginController= Get.put(AuthController(),tag: 'loginController');

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
                     child: Text('Email',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
                KTextField(
                  controller: loginController.emailController,
                  obSecureText: false,
                  hintText: 'Your email',
                  context: context,
                  keyboardType: TextInputType.emailAddress,
                ),
                2.height,
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Password',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),)),
               KTextField(
                    controller: loginController.passwordController,
                    hintText: '*********',
                    suffixIcon: loginController.showPassword.value? Icons.visibility: Icons.visibility_off,
                    obSecureText: loginController.showPassword.value,
                    suffixOnTap: (){
                      loginController.togglePassword();
                    },
                    context: context,
                  ),
                6.height,
                loginController.isLoading
                    ?kCircularLoading()
                    :kTextButton(
                  onPressed: (){
                    if(loginController.emailController.text.isEmpty){
                      showSnackBar('Error', 'Enter email address',isError: true);
                    }else if(loginController.passwordController.text.isEmpty){
                      showSnackBar('Error', 'Enter password',isError: true);
                    } else if(!loginController.isValidPassword(loginController.passwordController.text)){
                      showSnackBar('Error', 'Password must be at least 8 characters long.',isError: true);
                    }else{
                      loginController.logIn();
                    }
                  },
                  btnText: 'SIGN IN',
                  width: 50.w,
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
                RichText(
                  text:  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: primaryTextStyle(fontSize: 10.0,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),
                    children: <TextSpan>[
                    TextSpan(text: 'Sign up here',style: primaryTextStyle(fontSize: 11,fontWeight: FontWeight.w600,
                        color: AppColor.lightGreyColor),
                      recognizer: TapGestureRecognizer()..onTap=(){
                      Get.offAll(()=> SelectRole());
                    }
                    )
                    ],
                  ),
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
