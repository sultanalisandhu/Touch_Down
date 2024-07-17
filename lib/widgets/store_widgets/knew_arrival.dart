import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

Widget kStoreItemContainer({
  Function()? containerOnTap,
  String? imgPath,
  String? itemName,
  String? itemPrice,
  String? itemDescription,
  String? btnText,
}) {

  return Container(
    margin: EdgeInsets.symmetric( horizontal: 5,vertical: 5),
    height: 250,
    width: 200,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20,),topRight: Radius.circular(20)),
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
                    style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  10.width,
                  Text(itemPrice!,style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
              Text(itemDescription!,style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
              20.height,
              kTextButton(
                height: 40,
                width: 100,
                borderRadius: 10,
                color: AppColor.primaryColor,
                btnText: btnText
              )
            ],),
        )
      ],),
  );
}