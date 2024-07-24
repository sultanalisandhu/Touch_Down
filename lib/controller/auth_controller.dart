
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
 TextEditingController nameController= TextEditingController(text: 'Sultan Ali');
 TextEditingController emailController= TextEditingController(text: 'sultanali@gmail.com');
 TextEditingController passwordController= TextEditingController(text: '12345678@');
 TextEditingController phoneNumberController= TextEditingController();
 RxBool showPassword=true.obs;
 RxBool confirmPassword=false.obs;






 bool isValidPassword(String password) {
   String pattern = r'^(?=.*?[#?!@$%^&*-]).{8,}$';
   RegExp regex = RegExp(pattern);
   return regex.hasMatch(password);
 }
 bool isValidEmail(String email) {
   String pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
   RegExp regex = RegExp(pattern);
   return regex.hasMatch(email);
 }
 void togglePassword(){
   showPassword.value = !showPassword.value;
   update();
 }
 void confirmTogglePassword(){
   confirmPassword.value = !confirmPassword.value;
   update();
 }


}