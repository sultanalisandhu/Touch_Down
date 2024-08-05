import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/otp_screen.dart';
import 'package:touch_down/view/auth/update_password_screen.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class AuthController extends GetxController {
  BaseServices baseServices = BaseServices();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController updatedPinController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxBool showPassword = true.obs;
  RxBool confirmPassword = false.obs;
  final RxBool _isLoading = false.obs;
  final RxString selectedCode = '+91'.obs;
  RxInt sliding = 0.obs;
  // String get selectedCode => _selectedCode.value;
  /// getters
  bool get isLoading => _isLoading.value;

  ///setter
  set setLoading(v) => _isLoading.value = v;
  void setSelectedPhone(String value) {
    selectedCode.value = value;
  }

  var isCustomerSelected = true.obs;

  void toggleSelection() {
    isCustomerSelected.value = !isCustomerSelected.value;
  }



  void register() async {
    setLoading = true;
    try {
      printWarning('Current country code: ${selectedCode.toString()}');
      printWarning('Phone number before concatenation: ${phoneNumberController.text.trim()}');
      String fullPhoneNumber = '${selectedCode.value}${phoneNumberController.text.trim()}';
      printWarning('Full Phone Number: ${fullPhoneNumber}');

      final response = await baseServices.apiCall(
        'post',
        ApiRoutes.register,
        data: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'name': nameController.text.trim(),
          'phone': fullPhoneNumber,
        },
      );

      printWarning('Response: ${response?.data}');
      printWarning('Scode: ${response?.statusCode}');
      var data = response!.data;
      if (response.statusCode == 201) {
        showSnackBar('Success', data['result']['message'].toString());
        LocalStorage.instance.setUserId(data['result']['user']['id']);
        printWarning('UserId: ${data['result']['user']['id']}');
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => OtpScreen(email: emailController.text.trim()));
      } else if (response.statusCode == 409) {
        showSnackBar('Error', data['result']['message']);
        Get.offAll(() => LoginScreen());
      } else {
        showSnackBar('Error', data['result']['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('catch Error', e.toString());
      debugPrint('catch Error Response : ${e.toString()}');
    }
    setLoading = false;
  }


  void resendOtp() async {
    setLoading = true;
    try {
      final response =
          await baseServices.apiCall('post', ApiRoutes.reSendOtp, data: {
        'email': emailController.text.trim(),
      });
      debugPrint('Resend OTP Response: $response');
      debugPrint('Resend OTP Response code: ${response?.statusCode}');
      var data = response!.data;
      if (response.statusCode == 200) {
        showSnackBar('Success', data['result']['message'].toString());
      }  else {
        showSnackBar('Error', data['result']['message'].toString());
      }
    } catch (e) {
      showSnackBar('Error', e.toString(),isError: true);
    }
    setLoading = false;
  }

  void verifyOtp(String email) async {
    setLoading = true;
    try {
      debugPrint('Email before OTP verification: ${emailController.text}');
      final response = await baseServices.apiCall(
          'post',
          ApiRoutes.verifyOtp,
          data: {
            'email': email,
            'verificationCode': pinController.text.trim()
      });
      debugPrint('Verify OTP Response: $response');
      debugPrint('email: ${emailController.text}');
      debugPrint('verificationCode: ${pinController.text}');
      if (response!.statusCode == 200) {
        var data = response.data;
        debugPrint('Verify OTP 200 Response code: ${response.statusCode}');
        showSnackBar('Success', data['message'].toString());
      } else if (response.statusCode == 201) {
        var data = response.data;
        debugPrint('Verify OTP 201 Response code: ${response.statusCode}');
        showSnackBar('Success', data['result']['message'].toString());
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => LoginScreen());
      } else {
        showSnackBar('Error', 'Failed to verify OTP. Please try again.');
      }
    } catch (e) {
      showSnackBar('Error', e.toString());
      debugPrint('catch error: ${e.toString()}');
    }
    setLoading = false;
  }

  void logIn() async {
    setLoading = true;
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.logIn, data: {
        'email': emailController.text.trim(), 'password': passwordController.text.trim(),
      });
      var data = response!.data;
      if (response.statusCode == 200) {
        showSnackBar('Success', data['result']['message'].toString());
        Get.offAll(() => CustomBottomBar());
      }  else if(response.statusCode==403) {
        Get.offAll(() => OtpScreen(email: emailController.text.trim()));
        showSnackBar('Error', data['result']['message'].toString(),isError: true);
      }else{
        showSnackBar('Error', data['result']['message'].toString(),isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(),isError: true);
    }
    setLoading = false;
  }

  void forgotPassword() async {
    setLoading = true;
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.forgotPassword, data: {'email': emailController.text.trim(),
      });
      debugPrint('Forgot Password Response: $response');
      debugPrint('Forgot Password Response code: ${response!.statusCode}');
      var data = response.data;
      if (response.statusCode == 201) {
        showSnackBar('Success', data['result']['message'].toString());
        Get.to(() => UpdatePasswordScreen());
      } else {
          showSnackBar('Error',  data['result']['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString());
      debugPrint('Catch forgot password error: ${e.toString()}');
    }
    setLoading = false;
  }

  void updatePassword() async {
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.updatePassword, data: {
          'email': emailController.text.trim(),
          'code': updatedPinController.text.trim(),
          'password': newPasswordController.text.trim(),
        },
      );
      debugPrint('Scode: ${response!.statusCode}');
      var data = response.data;
      if (response.statusCode == 200) {
        showSnackBar('Success', data['result']['message'].toString());
        Get.offAll(()=> LoginScreen());
      }  else {
        showSnackBar('Error', data['result']['message']);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(),isError: true);
      debugPrint('Catch update password error: ${e.toString()}');
    }
  }

  bool isValidPassword(String password) {
    return password.length >= 8;
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

// demoApiCall() async {
//   try {
//     final response = await baseServices.apiCall('GET', 'https://jsonplaceholder.typicode.com/posts');
//     debugPrint('Demo API Response: ${response?.statusCode} ${response?.data}');
//     final data = response!.data;
//     if (response.statusCode == 200) {
//       showSnackBar('Success', data['message']);
//     } else {
//       showSnackBar('Error', data['errorMessage'], isError: true);
//     }
//   } catch (e) {
//     showSnackBar('Error', e.toString(), isError: true);
//   }
// }
}
