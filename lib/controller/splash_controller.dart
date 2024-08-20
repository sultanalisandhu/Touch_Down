
import 'package:get/get.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/welcome_screen.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';

class SplashController extends GetxController{


  Future<void> navigateTo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (LocalStorage.bearerToken == ''|| LocalStorage.bearerToken.isEmpty) {
        Get.offAll(() => const WelcomeScreen());
      } else {
        Get.offAll(() => CustomBottomBar());

      }
    });
  }
}