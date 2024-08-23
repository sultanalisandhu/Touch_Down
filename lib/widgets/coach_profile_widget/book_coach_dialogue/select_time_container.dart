import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';

class SelectDateContainer extends StatelessWidget {
  final Function()? onTap;
  final String? date;
  final String? day;
  final bool isSelected;
  const SelectDateContainer({super.key, this.onTap, this.date, this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        margin:  EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
            color: isSelected?AppColor.primaryColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected?Colors.transparent:AppColor.primaryColor)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date!, style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
            Text(day!, style: primaryTextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}


class SelectTimeContainer extends StatelessWidget {
  final Function()? onTap;
  final String? time;
  final bool isSelected;
  const SelectTimeContainer({super.key, this.onTap, this.time, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : Colors.green,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          time!,
          style: primaryTextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}