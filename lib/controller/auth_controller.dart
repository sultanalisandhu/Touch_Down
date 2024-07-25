import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class AuthController extends GetxController {
  BaseServices baseServices = BaseServices();
 TextEditingController nameController= TextEditingController(text: 'Sultan Ali');
 TextEditingController emailController= TextEditingController(text: 'sultanali@gmail.com');
 TextEditingController passwordController= TextEditingController(text: '12345678@');
 TextEditingController phoneNumberController= TextEditingController();
 RxBool showPassword=true.obs;
 RxBool confirmPassword=false.obs;
  final RxBool _isLoading = false.obs;
  /// getters
  bool get isLoading => _isLoading.value;

  ///setter
  set setLoading(v) => _isLoading.value = v;


  void register() async {
    setLoading=true;
    try{
      final response =
      await baseServices.apiCall('post', ApiRoutes.register, data: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'name': nameController.text.trim(),
        'phone': phoneNumberController.text.trim(),
      });
      debugPrint('Register Response: $response');
      if (response?.statusCode == 200) {
        var data = json.decode(response!.data);
        LocalStorage.instance.setBearerToken(data['data']['token']);
        showSnackBar('Success', data['message'].toString());
        await Future.delayed(const Duration(seconds: 2));
        Get.to(() => CustomBottomBar());
      }
    } catch (e) {
      showSnackBar('Error', e.toString());
    }
    setLoading=false;
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


  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }

  void confirmTogglePassword() {
    confirmPassword.value = !confirmPassword.value;
    update();
  }

  demoApiCall() async {
    try {
      final response = await baseServices.apiCall('GET', 'https://jsonplaceholder.typicode.com/posts');
      debugPrint('Demo API Response: ${response?.statusCode} ${response?.data}');
      final data = response!.data;
      if (response.statusCode == 200) {
        showSnackBar('Success', data['message']);
      } else {
        showSnackBar('Error', data['errorMessage'], isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(), isError: true);
    }
  }

}
