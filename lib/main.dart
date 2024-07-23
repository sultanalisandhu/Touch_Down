import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/view/auth/welcome_screen.dart';
import 'package:touch_down/view/home_ui/home_screen.dart';

void main() {
  runApp(DevicePreview(builder: (BuildContext context)=> const MyApp()));
  // runApp(const MyApp());
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
            home:  HomeScreen(),
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
          );
        });

  }
}

