import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/services/dependency_injection_services.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/view/auth/select_role.dart';
import 'package:touch_down/view/auth/splash_screen.dart';
import 'package:touch_down/view/auth/welcome_screen.dart';
import 'package:touch_down/view/coach_ui/coach_index_page.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile1.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile2.dart';
import 'package:touch_down/view/auth/coach_registration_screens/coach_registration1.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/coach_drawer/add_availability.dart';

import 'view/profile_ui/coach_profile_ui/coach_profile_screen.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(DevicePreview(
      enabled: false,
      builder: (BuildContext context)=> const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context,orientation,deviceType){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Touch Down',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.whiteColor,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
              useMaterial3: true,
            ),
            home:  SplashScreen(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
          );
        });
  }
}
