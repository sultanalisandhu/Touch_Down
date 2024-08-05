import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile2.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class EditCoachProfile1 extends StatelessWidget {
  EditCoachProfile1({Key? key,}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoachController coachController = Get.put(CoachController());
    return Obx(()=>Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: kAppBar(
          titleText: 'Edit Your Profile',
          backgroundColor: AppColor.primaryColor
      ),
      body: Stack(
        children: [
          Column(
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
                      SizedBox(height: mQ.width * 0.25 * 0.7),
                      2.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.height,
                          Row(
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Name',
                                      style: primaryTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    KTextField(
                                      controller: coachController.cNameController,
                                      hintText: 'Your Name',
                                      obSecureText: false,
                                      context: context,
                                      hintTextColor: AppColor.blackColor,
                                      borderColor: AppColor.blackColor,
                                      textColor: AppColor.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                              2.width,
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(
                                    'Email ID',
                                    style: primaryTextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  KTextField(
                                    controller: coachController.cEmailController,
                                    hintText: 'email@gmail.com',
                                    keyboardType: TextInputType.emailAddress,
                                    obSecureText: false,
                                    context: context,
                                    hintTextColor: AppColor.blackColor,
                                    borderColor: AppColor.blackColor,
                                    textColor: AppColor.blackColor,
                                  ),
                                ],),
                              )
                            ],
                          ), 2.height,
                          Text(
                            'Mobile Number',
                            style: primaryTextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          KTextField(
                            controller: coachController.cMobileController,
                            hintText: '0987654321',
                            keyboardType: TextInputType.phone,
                            obSecureText: false,
                            context: context,
                            hintTextColor: AppColor.blackColor,
                            borderColor: AppColor.blackColor,
                            textColor: AppColor.blackColor,
                          ),
                          2.height,
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Academy Location',
                                      style: primaryTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    KTextField(
                                      controller: coachController.cAddressController,
                                      hintText: 'enter coaching address',
                                      keyboardType: TextInputType.streetAddress,
                                      obSecureText: false,
                                      maxLength: 20,
                                      context: context,
                                      hintTextColor: AppColor.blackColor,
                                      borderColor: AppColor.blackColor,
                                      textColor: AppColor.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                              2.width,
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'City Name',
                                      style: primaryTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    KTextField(
                                      controller: coachController.cLocationController,
                                      hintText: 'enter city e.g delhi',
                                      keyboardType: TextInputType.text,
                                      obSecureText: false,
                                      context: context,
                                      hintTextColor: AppColor.blackColor,
                                      borderColor: AppColor.blackColor,
                                      textColor: AppColor.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          DescriptionTextField(controller: coachController.cDescriptionController,),
                          5.height,
                          Align(
                            alignment: Alignment.center,
                            child: kTextButton(
                              onPressed: () {
                                Get.off(()=> EditCoachProfile2());
                              },
                              btnText: 'NEXT',
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
          Positioned(
            top: mQ.width * 0.14 * 0.9,
            left: (mQ.width / 2) - mQ.width * 0.16,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    coachController.pickImage(ImageSource.gallery);
                  },
                  child: CircleAvatar(
                    radius: mQ.width * 0.16,
                    backgroundColor: AppColor.greyColor,
                    child: CircleAvatar(
                      radius: mQ.width * 0.16 * 0.9,
                      backgroundColor: AppColor.whiteColor,
                      backgroundImage: coachController.selectedImagePath.value.isEmpty
                          ? const NetworkImage(
                          'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg')
                          : FileImage(File(coachController.selectedImagePath.value)) as ImageProvider,
                    ),
                  ),
                ),
                Text(
                  'Change Profile Picture',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }

}
