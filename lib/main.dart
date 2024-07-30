import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/view/auth/forget_password.dart';
import 'package:touch_down/view/auth/login_screen.dart';
import 'package:touch_down/view/auth/otp_screen.dart';
import 'package:touch_down/view/auth/register_screen.dart';
import 'package:touch_down/view/auth/update_password_screen.dart';
import 'package:touch_down/view/auth/welcome_screen.dart';
import 'package:touch_down/view/more_ui/book_venue_inner.dart';
import 'package:touch_down/view/more_ui/pick_drop_screen.dart';
import 'package:touch_down/view/more_ui/search_venue_screen.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/view/store_ui/store_screen.dart';
import 'view/more_ui/book_venue_screen.dart';
import 'view/profile_ui/user_profile_screen.dart';


void main() {
  // runApp(DevicePreview(builder: (BuildContext context)=> const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context,orientation,deviceType){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:  WelcomeScreen(),
            // useInheritedMediaQuery: true,
            // locale: DevicePreview.locale(context),
          );
        });

  }
}

