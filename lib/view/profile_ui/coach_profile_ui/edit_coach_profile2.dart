import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class EditCoachProfile2 extends StatelessWidget {
  EditCoachProfile2({Key? key,}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    final CoachController coachController = Get.put(CoachController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: kAppBar(
          titleText: 'Edit Your Profile',
          backgroundColor: AppColor.primaryColor
      ),
      body: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            height: mQ.width * 0.15 + 50,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(2.h),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invidual Coaching Fee ',
                        style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      KTextField(
                        controller: coachController.cMobileController,
                        hintText: 'Enter the fee',
                        keyboardType: TextInputType.phone,
                        obSecureText: false,
                        context: context,
                        hintTextColor: AppColor.blackColor,
                        borderColor: AppColor.blackColor,
                        textColor: AppColor.blackColor,
                      ),
                      2.height,
                      Text(
                        'Group Coaching Fee ',
                        style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      KTextField(
                        controller: coachController.cMobileController,
                        hintText: 'Enter the fee',
                        keyboardType: TextInputType.phone,
                        obSecureText: false,
                        context: context,
                        hintTextColor: AppColor.blackColor,
                        borderColor: AppColor.blackColor,
                        textColor: AppColor.blackColor,
                      ),
                      2.height,
                      Text(
                        'Upload Aadhar Card',
                        style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      KTextField(
                        controller: coachController.cAddressController,
                        hintText: 'File Upload',
                        keyboardType: TextInputType.streetAddress,
                        obSecureText: false,
                        maxLength: 20,
                        context: context,
                        hintTextColor: AppColor.blackColor,
                        borderColor: AppColor.blackColor,
                        textColor: AppColor.blackColor,
                        suffixIcon: Icons.file_upload_outlined,
                      ),
                      2.height,
                      Text(
                        'Upload Certificates',
                        style: primaryTextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      KTextField(
                        controller: coachController.cLocationController,
                        hintText: 'File Upload',
                        keyboardType: TextInputType.text,
                        obSecureText: false,
                        context: context,
                        hintTextColor: AppColor.blackColor,
                        borderColor: AppColor.blackColor,
                        textColor: AppColor.blackColor,
                        suffixIcon: Icons.file_upload_outlined,
                      ),
                      5.height,
                      Align(
                        alignment: Alignment.center,
                        child: kTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          btnText: 'Update Profile',
                          width: 40.w,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
