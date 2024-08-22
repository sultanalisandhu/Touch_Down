import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/extras/toggle_button.dart';
import 'package:touch_down/widgets/auth_widgets/auth_widget.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/auth_widgets/k_check_box.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class RegisterScreen extends StatelessWidget {
  final String userRole;
   RegisterScreen({super.key, this.userRole = ''});
   final AuthController controller=Get.put(AuthController(),tag: 'Auth Controller');

   @override
  Widget build(BuildContext context) {
    return Obx(()=> Stack(
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
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          3.height,
                          const Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
                          2.height,
                          Text('REGISTER',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColor.whiteColor),),
                          Text('You And Your Friends Always Connected',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.whiteColor),),
                        ],
                      ),
                    ),
                    4.height,
                    Text('User Name',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      hintText: 'Your User Name',
                      controller: controller.nameController,
                      obSecureText: false,
                      context: context,
                      keyboardType: TextInputType.text,
                    ),
                    2.height,
                    Text('Enter Your Email',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      controller: controller.emailController,
                      hintText: 'email',
                      obSecureText: false,
                      context: context,
                      keyboardType: TextInputType.emailAddress,
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
                      hintText: '3117654321',
                      keyboardType: TextInputType.phone,
                      prefixIcon: CountryCodePickerWidget(controller: controller,),
                      obSecureText: false,
                      context: context,
                    ),
                    1.height,
                    CustomCheckbox(
                      isChecked: controller.isTermsAccepted,
                      onChanged: (bool value) {
                      controller.isTermsAccepted.value = value;
                    },),
                    6.height,
                    controller.isLoading
                        ?kCircularLoading()
                        : Align(
                      alignment: Alignment.center,
                      child: kTextButton(
                        onPressed: (){
                          if (controller.isTermsAccepted.value) {
                            controller.register(userRole);
                          } else {
                            showSnackBar('Error', 'You must accept the terms and conditions to sign up',isError: true);
                          }
                        },
                        btnText: 'SIGN UP',
                        width: 50.w,
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
                    Center(
                      child: RichText(
                        text:  TextSpan(
                          text: 'Already have an account? ',
                          style: primaryTextStyle(fontSize: 10.0,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),
                          children: <TextSpan>[
                            TextSpan(text: 'Login',style: primaryTextStyle(fontSize: 11,fontWeight: FontWeight.w600,
                                color: AppColor.lightGreyColor),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  Get.offAll(()=> LoginScreen());
                                }
                            )
                          ],
                        ),
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
