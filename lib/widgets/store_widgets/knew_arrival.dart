import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_buttons.dart';

Widget kStoreItemContainer({
  Function()? containerOnTap,
  String? imgPath,
  String? itemName,
  String? itemPrice,
  String? itemDescription,
  String? btnText,
}) {

  return Container(
    margin: const EdgeInsets.symmetric( horizontal: 5,vertical: 5),
    height: 25.h,
    width: 40.w,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:12.h,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20,),topRight: Radius.circular(20)),
              image:   DecorationImage(image: NetworkImage(imgPath!),fit: BoxFit.cover)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    itemName!,
                    style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w700),),
                  1.width,
                  Text(itemPrice!,style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w500),),
                ],
              ),
              Text(itemDescription!,style: primaryTextStyle(fontSize: 7,fontWeight: FontWeight.w400),),
              2.height,
              kTextButton(
                height: 3.h,
                width: 50.w,
                borderRadius: 10,
                color: AppColor.primaryColor,
                btnText: btnText
              )
            ],),
        )
      ],),
  );
}