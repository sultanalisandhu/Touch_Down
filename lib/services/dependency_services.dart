import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/controller/geo_location_controller.dart';
import 'package:touch_down/controller/home_controller.dart';

class DependencyInjection {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    Get.put<GetConnect>(GetConnect());
    Get.put(HomeController(),tag: 'homeController');
    Get.put(CoachController(),tag: 'coachController');
    Get.put(LocationController(),tag: 'locationController');
  }
}



//get device id
// final deviceInfo = DeviceInfoPlugin();
// String? deviceID;
// void getDeviceId() async {
//   if (GetPlatform.isAndroid) {
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     deviceID = androidInfo.id;
//   } else {
//     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//     deviceID = iosInfo.identifierForVendor;
//   }
//   StorageHelper.setDeviceID(deviceID.toString());
//   printWarning('device info: ${StorageHelper.deviceID}');
// }