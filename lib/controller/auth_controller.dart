
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
 TextEditingController emailController= TextEditingController();
 TextEditingController passwordController= TextEditingController();
 TextEditingController phoneNumberController= TextEditingController();
 TextEditingController locationController= TextEditingController();
 RxBool showPassword=false.obs;
 RxBool confirmPassword=false.obs;

 void togglePassword(){
   showPassword.value = !showPassword.value;
   update();
 }
 void confirmTogglePassword(){
   confirmPassword.value = !confirmPassword.value;
   update();
 }


}