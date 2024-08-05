import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/coach_ui/type_ahead.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/book_payment_methods.dart';
import 'package:touch_down/widgets/k_buttons.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/coach_ui/type_ahead.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class BookCoachDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CoachController dateController = Get.put(CoachController());

    return AlertDialog(
      backgroundColor: Colors.grey[200],
      contentPadding: const EdgeInsets.all(10),
      content: Container(
        width: mQ.width,
        padding: const EdgeInsets.all(12),
        child: Obx(() {
          final selectedDate = dateController.selectedDate.value;
          print('Selected Date: $selectedDate');
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: mQ.height * 0.15,
                      width: mQ.width * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(color: AppColor.primaryColor, width: 5),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp=1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',
                          ),
                        ),
                      ),
                    ),
                    1.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Martin Desouza',
                          style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Cricket Coach',
                          style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: primaryTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                2.height,
                DatePicker(
                  DateTime.now(),
                  width: 13.w,
                  initialSelectedDate:  DateTime.now(),
                  selectionColor: AppColor.primaryColor,
                  selectedTextColor: Colors.white,
                  dateTextStyle: primaryTextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  dayTextStyle: primaryTextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  monthTextStyle: primaryTextStyle(
                    fontSize: 0,
                    color: Colors.transparent,
                  ),
                  onDateChange: (date) {
                    dateController.selectedDate.value = date;
                  },
                ),
                Divider(
                  color: AppColor.primaryColor,
                  height: 2.h,
                ),
                Text(
                  'Available Time',
                  style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: AppColor.primaryColor,
                  height: 2.h,
                ),
                5.height,
                kTextButton(
                  onPressed: () {
                   Get.to(()=> BookingMethods());
                  },
                  borderRadius: 25,
                  height: 5.h,
                  width: 50.w,
                  btnText: 'BOOK A COACH',
                  textColor: AppColor.blackColor,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

