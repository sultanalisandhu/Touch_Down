import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class BookingMethods extends StatelessWidget {
  BookingMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoachController coachController = Get.put(CoachController());

    // Dummy list of payment methods for illustration
    final List<String> paymentMethods = ['Card Payment', 'UPI Payment', 'Net Banking', 'Cash Payment'];

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: kAppBar(
        titleText: 'Edit Your Profile',
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            height: MediaQuery.of(context).size.width * 0.15 + 50,
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
                padding: EdgeInsets.all(3.h),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Coaching Fee',
                        style: primaryTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Individual Coaching Fee',
                            style: primaryTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '₹ 500/- ',
                            style: primaryTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColor.primaryColor,
                        height: 3.h,
                      ),
                      Text(
                        'Select Payment Method',
                        style: primaryTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.height,
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColor.primaryColor),
                        ),
                        child: SizedBox(
                          height: paymentMethods.length * 60.0,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: paymentMethods.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: AppColor.primaryColor, width: 1.0),
                                  ),
                                ),
                                child: ListTile(
                                  onTap: ()=> successDialog(context),
                                  contentPadding: EdgeInsets.zero,
                                  leading: showSvgIconWidget(iconPath: IconUtils.chatIcon),
                                  title: Text(
                                    paymentMethods[index],
                                    style: primaryTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  trailing: CircleAvatar(
                                    backgroundColor: AppColor.primaryColor,
                                    child: Icon(Icons.arrow_forward_ios, size: 2.h),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
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
  void successDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            icon: const CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.primaryColor,
              child: Icon(Icons.check, color: Colors.white,size: 40,),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Booking',
                  style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                Text(
                  'Successful !',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
                1.height,
                Text(
                  'We will confirm your booking in sometime',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 10),
                ),
                2.height,
                kTextButton(
                  onPressed: () {
                   Get.to(()=> CustomBottomBar());
                  },
                  color: AppColor.primaryColor,
                  width: 55.w,
                  borderRadius: 20,
                  height: 5.h,
                  btnText: 'Okay !',
                  textColor: AppColor.blackColor,
                ),
              ],
            ),
          ),
    );
  }
}
