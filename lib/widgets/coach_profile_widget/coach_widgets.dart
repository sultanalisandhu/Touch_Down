import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String review;
  final int rating;

  const ReviewCard({super.key, required this.name, required this.date, required this.review, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:AppColor.greyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin:  EdgeInsets.symmetric(vertical: 1.h),
      child: Padding(
        padding:  EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.bold,),
                ),
                Text(
                  date,
                  style: primaryTextStyle(fontSize: 8,),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 2.h,
                    );
                  }),
                ),
              ],
            ),
            1.height,
            Text(
              review,
              style: primaryTextStyle(fontSize: 10,),
            ),
          ],
        ),
      ),
    );
  }
}
class UserProfileContainer extends StatelessWidget {
  final String matchResult;
  final String matchScore;
  final String matchName;
  final String matchLocation;

  UserProfileContainer({required this.matchResult, required this.matchScore, required this.matchName, required this.matchLocation,});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:AppColor.containerGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  matchName,
                  style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                ),
                Text(
                  matchLocation,
                  style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400),
                ),
              ],
            ),
            1.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  matchResult,
                  style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w600,),
                ),
                Text(
                  matchScore,
                  style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




Widget coachDetailContainer({
  String? title,
IconData? iconPath,
}){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 0.5.h),
    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.5.h),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(22)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(iconPath,color: AppColor.blackColor,size: 4.w,),
        Text(title!,style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: AppColor.blackColor),),
      ],
    ),
  );
}