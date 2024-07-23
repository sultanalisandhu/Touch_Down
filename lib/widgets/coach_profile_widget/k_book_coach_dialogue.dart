import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/coach_ui/type_ahead.dart';
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
      contentPadding: EdgeInsets.all(10),
      content: Container(
        width: mQ.width,
        padding: EdgeInsets.all(12),
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
                      height: mQ.height * 0.2,
                      width: mQ.width * 0.3,
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
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Martin Desouza',
                          style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Cricket Coach',
                          style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  DateFormat('MMMM yyyy').format(selectedDate),
                  style: primaryTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                16.height,
                DatePicker(
                  DateTime.now(),
                  width: 13.w,
                  initialSelectedDate:  DateTime.now(),
                  selectionColor: AppColor.primaryColor,
                  selectedTextColor: Colors.white,
                  dateTextStyle: primaryTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  dayTextStyle: primaryTextStyle(
                    fontSize: 14,
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
                10.height,
                Text(
                  'Select Location',
                  style: primaryTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                10.height,
                TypeAhead(),
                kTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  borderRadius: 25,
                  height: 45,
                  width: 180,
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












// class BookCoachDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final CoachController dateController = Get.put(CoachController());
//
//     return AlertDialog(
//       backgroundColor: Colors.grey[200],
//       contentPadding: EdgeInsets.all(10),
//       content: SingleChildScrollView(
//         child: Obx(() => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               DateFormat('MMMM yyyy').format(dateController.selectedDate.value),
//               style: primaryTextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             16.height,
//             DatePicker(
//               DateTime.now(),
//               initialSelectedDate: DateTime.now(),
//               selectionColor: AppColor.primaryColor,
//               selectedTextColor: Colors.white,
//               dateTextStyle: primaryTextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               dayTextStyle: primaryTextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               monthTextStyle: primaryTextStyle(
//                 fontSize: 0,
//                 color: Colors.transparent,
//               ),
//               onDateChange: (date) {
//                 dateController.selectedDate.value = date;
//               },
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }

