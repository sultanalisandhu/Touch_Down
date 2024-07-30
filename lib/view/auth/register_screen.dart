import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/toggle_button.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_bg_img.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_check_box.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   final AuthController controller=Get.put(AuthController(),tag: 'Auth Controller');
   final RxBool isTermsAccepted = false.obs;
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
                    1.height,
                    ToggleButtonsWidget(controller: controller,),
                    4.height,
                    Text('User Name',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
                    KTextField(
                      hintText: 'Your User Name',
                      controller: controller.nameController,
                      obSecureText: false,
                      context: context,
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
                      prefixIcon: CountryCodePicker(
                        onChanged: (cc) => controller.setSelectedPhone(cc.dialCode!),
                        initialSelection: 'IN',
                        showCountryOnly: true,
                        showDropDownButton: true,
                        showFlag: true,
                        showOnlyCountryWhenClosed: true,
                        favorite: const ['+49', '+92'],
                        builder: (countryCode) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                            child: Text(
                              countryCode.toString(),
                              style:  primaryTextStyle(
                                fontSize: 11,
                                color: AppColor.whiteColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                      obSecureText: false,
                      context: context,
                    ),
                    1.height,
                    CustomCheckbox(
                      isChecked: isTermsAccepted,
                      onChanged: (bool value) {
                      isTermsAccepted.value = value;
                    },),
                    6.height,
                    controller.isLoading
                        ? const Center(child:  CircularProgressIndicator(
                            color: AppColor.whiteColor,
                            strokeCap: StrokeCap.round,
                            backgroundColor: Colors.black,),)
                        : Align(
                      alignment: Alignment.center,
                      child: controller.isLoading
                          ? kCircularLoading()
                          : kTextButton(
                        onPressed: (){
                          if (isTermsAccepted.value) {
                            controller.register();
                          } else {
                            showSnackBar('Error', 'You must accept the terms and conditions to sign up',isError: true);
                          }
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
                        GestureDetector(
                            onTap: (){
                              Get.offAll(()=> LoginScreen());
                            },
                            child: Text('LogIn',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColor.lightGreyColor),)),
                      ],
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
