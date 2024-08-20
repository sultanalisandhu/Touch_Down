import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/auth_widgets/k_check_box.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class CoachRegistration2 extends StatelessWidget {
  final String sportId;
  CoachRegistration2({Key? key}):sportId = Get.arguments['sportId'],
        super(key: key);


  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final args = Get.arguments;
    final String sportId = args['sportId'];
    final String role = args['role'];
    final CoachController coachController = Get.put(CoachController());
    return Obx(()=>Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          scrolledUnderElevation: 0.0,
          title: Text(
            'Create Your Profile',
            style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
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
                            2.height,
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
                            2.height,
                            Text('Enter Password',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                            KTextField(
                              controller: coachController.cPasswordController,
                              hintText: '*******',
                              hintTextColor: AppColor.blackColor,
                              borderColor: AppColor.blackColor,
                              textColor: AppColor.blackColor,
                              obSecureText: coachController.showPassword.value,
                              suffixIcon: coachController.showPassword.value?Icons.visibility:Icons.visibility_off,
                              suffixOnTap: (){
                                coachController.togglePassword();
                              },
                              context: context,
                            ),
                            2.height,
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
                            1.height,
                            CustomCheckbox(
                              chkBrderColor: AppColor.blackColor,
                              textColor: AppColor.blackColor,
                              isChecked: coachController.isTermsAccepted,
                              onChanged: (bool value) {
                                coachController.isTermsAccepted.value = value;
                              },
                            ),
                            5.height,
                            coachController.isLoading
                                ?kCircularLoading()
                                :Align(
                              alignment: Alignment.center,
                              child: kTextButton(
                                onPressed: () {
                                  if (coachController.isTermsAccepted.value) {
                                    coachController.coachRegister(sportId,role);
                                  } else {
                                    showSnackBar('Error', 'You must accept the terms and conditions to sign up', isError: true);
                                  }
                                },
                                btnText: 'YOU ARE ALL SET ! GET STARTED',
                                width: 70.w,
                                height: 5.h,
                                borderRadius: 26,
                                textColor: AppColor.blackColor,
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
                            'https://img.freepik.com/premium-vector/blue-circle-with-white-user-vector_941526-5784.jpg?w=900')
                            : FileImage(File(coachController.selectedImagePath.value)) as ImageProvider,
                      ),
                    ),
                  ),
                  Text(
                    'Add Profile Photo',
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
