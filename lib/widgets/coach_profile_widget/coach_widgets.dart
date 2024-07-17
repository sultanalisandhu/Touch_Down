import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String review;
  final int rating;

  ReviewCard({required this.name, required this.date, required this.review, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:AppColor.greyColor,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                ),
                Text(
                  date,
                  style: primaryTextStyle(fontSize: 12,),
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 20,
                    );
                  }),
                ),
              ],
            ),

            8.height,
            Text(
              review,
              style: primaryTextStyle(fontSize: 14,),
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
      color:AppColor.greyColor,
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
                  style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
                Text(
                  matchLocation,
                  style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                ),
              ],
            ),
            15.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  matchResult,
                  style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w600,),
                ),
                Text(
                  matchScore,
                  style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                ),
              ],
            ),

            8.height,


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
    margin: EdgeInsets.symmetric(vertical: 5),
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(22)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(iconPath,color: AppColor.blackColor,),
        Text(title!,style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.blackColor),),
      ],
    ),
  );
}