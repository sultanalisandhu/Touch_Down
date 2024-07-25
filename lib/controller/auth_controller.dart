import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class AuthController extends GetxController{
  BaseServices baseServices = BaseServices();
 TextEditingController nameController= TextEditingController(text: 'Sultan Ali');
 TextEditingController emailController= TextEditingController(text: 'sultanali@gmail.com');
 TextEditingController passwordController= TextEditingController(text: '12345678@');
 TextEditingController phoneNumberController= TextEditingController();
 RxBool showPassword=true.obs;
 RxBool confirmPassword=false.obs;



 void register() async{
final response= await baseServices.apiCall('put',ApiRoutes.register,data: {
 'email' : emailController.text.trim(),
 'password': passwordController.text.trim(),
 'fullname': nameController.text.trim(),
 'phone': phoneNumberController.text.trim(),
 });
   if(response.statusCode==200){
     var data= jsonDecode(response.body);
     LocalStorage.instance.setBearerToken(data['data']['token']);
     showSnackBar('Success', data['message'].toString());
     await Future.delayed(const Duration(seconds: 2));
     Get.to(()=>CustomBottomBar());
   }else{
     var data = jsonDecode(response.body);
     showSnackBar('Error', data['message'].toString());
   }
 }

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