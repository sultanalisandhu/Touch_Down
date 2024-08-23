import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/controller/geo_location_controller.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/services/dependency_injection_services.dart';
import 'package:touch_down/services/user_profile_services.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/otp_screen.dart';
import 'package:touch_down/view/auth/splash_screen.dart';
import 'package:touch_down/view/auth/update_password_screen.dart';
import 'package:touch_down/view/auth/welcome_screen.dart';
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

  ///variables
  final RxBool showPassword = true.obs;
  final RxBool isTermsAccepted = false.obs;
  final RxBool _isLoading = false.obs;
  final RxString selectedCode = '+91'.obs;
  RxInt sliding = 0.obs;

  /// getters
  bool get isLoading => _isLoading.value;

  ///setter
  set setLoading(v) => _isLoading.value = v;

  Future register(String userRole) async {
    setLoading = true;
    try {
      String fullPhoneNumber = '${selectedCode.value}${phoneNumberController.text.trim()}';
      final response = await baseServices.apiCall(
        'post',
        ApiRoutes.registerUser,
        data: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'name': nameController.text.trim(),
          'phone': fullPhoneNumber,
          'userRole': userRole
        },
      );
      var data = response!.data;
      if (response.statusCode == 201) {
        UserProfileService.saveUserProfileData(data);
        showSnackBar('Success', data['result']['message'].toString());
        Get.offAll(() => OtpScreen(email: emailController.text.trim()));
      }
      else if (response.statusCode == 409) {
        showSnackBar('Error', data['result']['message'],isError: true);
        Get.offAll(() => LoginScreen());
      } else {
        showSnackBar('Error', data['result']['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('caught Error', e.toString());
      debugPrint('catch Error Response : ${e.toString()}');
    }
    setLoading = false;
  }


  logIn() async {
    setLoading = true;
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.logIn, data: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      });
      var data = response!.data;
      if (response.statusCode == 200) {
        UserProfileService.saveUserProfileData(data);
        showSnackBar('Success', data['result']['message'].toString());
        DependencyInjection.init();
        Get.offAll(() => CustomBottomBar());
      }  else if(response.statusCode==403) {
        Get.to(() => OtpScreen(email: emailController.text));
        resendOtp(emailController.text);
        showSnackBar('Error', data['result']['message'].toString(),isError: true);
      }else{
        showSnackBar('Error', data['result']['message'].toString(),isError: true);
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(),isError: true);
      printWarning('Caught Error: ${e.toString()}');
    }
    setLoading = false;
  }
  logOut() async {
    Get.delete<HomeController>(tag: 'homeController');
    Get.delete<CoachController>(tag: 'coachController');
    Get.delete<LocationController>(tag: 'locationController');
    await LocalStorage.eraseAllLocalStorage();
    Get.offAll(() => const WelcomeScreen());
  }




  void resendOtp(String? email) async {
    setLoading = true;
    try {
      final response =
          await baseServices.apiCall('post', ApiRoutes.reSendOtp, data: {
        'email': email,
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
      debugPrint('email: ${emailController.text}');
      debugPrint('verificationCode: ${pinController.text}');
      var data = response!.data;
      if (response.statusCode == 200) {
        debugPrint('Verify OTP 200 Response code: ${response.statusCode}');
        showSnackBar('Success', data['message'].toString());
      } else if (response.statusCode == 201) {
        var data = response.data;
        debugPrint('Verify OTP 201 Response code: ${response.statusCode}');
        showSnackBar('Success', data['result']['message'].toString());
        Get.offAll(() => LoginScreen());
      } else {
        showSnackBar('Error', data['message'],isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString());
      debugPrint('catch error: ${e.toString()}');
    }
    setLoading = false;
  }


  void forgotPassword() async {
    setLoading = true;
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.forgotPassword, data: {
        'email': emailController.text.trim(),
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
    setLoading=true;
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
    setLoading=false;
  }




  void setSelectedPhone(String value) {
    selectedCode.value = value;
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

}
