import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';

Widget kCircularLoading(){
  return const Center(child:  CircularProgressIndicator(
    color: AppColor.whiteColor,
    strokeCap: StrokeCap.round,
    backgroundColor: Colors.black,),);
}