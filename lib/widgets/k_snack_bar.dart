
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';


void showSnackBar(String title, String message,{isError = false}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: message,
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: isError? Colors.red : AppColor.primaryColor,
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      dismissDirection: DismissDirection.horizontal,
      snackPosition: SnackPosition.TOP,
    ),
  );
}