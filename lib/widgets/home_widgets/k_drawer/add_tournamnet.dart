import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/add_team.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class AddTournamnet extends StatelessWidget {
  const AddTournamnet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.height,
          Text('Select Sports',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          2.height,
          Text('Tournament Name',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          2.height,
          Text('Location',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          2.height,
          Text('Select Date',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          2.height,
          Text('Select Time',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
          GetTextField(context: context),
          4.height,
          Align(
            alignment: Alignment.center,
            child: kTextButton(
              onPressed: (){
                Get.to(()=> AddTeam());
              },
              btnText: 'Add Tournament',
                textColor: AppColor.blackColor,
              borderRadius: 26,
              width: 50.w,
              height: 5.h
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 10)
    );
  }
}
