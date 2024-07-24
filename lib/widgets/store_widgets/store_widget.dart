import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';

Widget storeItems ({
  String? imgPath,
  String? itemName,
  double? height,
  double? width,
}){
  return  Container(
    height: height?? 0,
    width: height?? 0,
    decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            fit: BoxFit.cover,
            image:
            NetworkImage(imgPath!))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Text(itemName!,style: primaryTextStyle(
                fontSize: 7,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor),))
      ],
    ),
  );
}