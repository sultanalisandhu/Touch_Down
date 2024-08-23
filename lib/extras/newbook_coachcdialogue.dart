// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:sizer/sizer.dart';
// import 'package:touch_down/controller/coach_controller.dart';
// import 'package:touch_down/utils/constants.dart';
// import 'package:touch_down/utils/extensions/extensions.dart';
// import 'package:touch_down/widgets/coach_profile_widget/book_coach_dialogue/select_time_container.dart';
// import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
// import 'package:touch_down/widgets/coach_profile_widget/double_checkbox.dart';
// import 'package:touch_down/widgets/k_buttons.dart';
//
// class BookCoachDialog extends StatelessWidget {
//   final String? imgUrl;
//   final String? coachName;
//   final String? coachSport;
//   final String? coachId;
//
//   const BookCoachDialog({
//     super.key,
//     this.imgUrl,
//     this.coachName,
//     this.coachSport,
//     this.coachId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final CoachController coachController = Get.find<CoachController>(tag: 'coachController');
//
//     return AlertDialog(
//       backgroundColor: Colors.grey[200],
//       content: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: Obx(() {
//           final availableDates = coachController.coachMonthlyAvailability.result?.availableDates ?? [];
//           return SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildCoachInfo(context),
//                 _buildMonthSelector(coachController),
//                 2.height,
//                 _buildAvailableDatesList(availableDates, coachController),
//                 const Divider(color: AppColor.primaryColor, height: 20),
//                 _buildAvailableTimeSection(coachController),
//                 const Divider(color: AppColor.primaryColor, height: 20),
//                 _buildCoachingOptions(coachController),
//                 2.height,
//                 _buildBookCoachButton(coachController,context),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }
//
//   Row _buildCoachInfo(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         imgContainerCoach(height: 13.h, width: 25.w, imgUrl: imgUrl),
//         SizedBox(width: MediaQuery.of(context).size.width * 0.05),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               coachName ?? '',
//               style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             Text(
//               coachSport ?? '',
//               style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Row _buildMonthSelector(CoachController coachController) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//           onPressed: () => coachController.decrementMonth(coachId!),
//           icon: Icon(Icons.arrow_back, size: 3.h),
//         ),
//         Text(
//           DateFormat('MMMM yyyy').format(coachController.selectedDate.value),
//           style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//         ),
//         IconButton(
//           onPressed: () => coachController.incrementMonth(coachId!),
//           icon: Icon(Icons.arrow_forward, size: 3.h),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAvailableDatesList(List<String> availableDates, CoachController coachController) {
//     return availableDates.isNotEmpty
//         ? SizedBox(
//          height: 10.h,
//         width: mQ.width,
//          child: ListView.builder(
//          scrollDirection: Axis.horizontal,
//          itemCount: availableDates.length,
//          itemBuilder: (context, index) {
//           DateTime date = DateTime.parse(availableDates[index]);
//           String day = DateFormat('EEE').format(date);
//           String dateNum = DateFormat('d').format(date);
//           bool isSelected = coachController.selectedDate.value == date;
//           return SelectDateContainer(
//             onTap: () {
//               coachController.selectedDate.value = date;
//               coachController.getCoachTimeAvailability(date, coachId!);
//             },
//             isSelected: isSelected,
//             date: dateNum,
//             day: day,
//           );
//         },
//       ),
//     )
//         : Text('No dates available', style: primaryTextStyle(fontSize: 14));
//   }
//
//   Widget _buildAvailableTimeSection(CoachController coachController) {
//     return Obx(() {
//       if (coachController.coachTimeAvailability.result == null ||
//           coachController.coachTimeAvailability.result!.slots == null) {
//         return Center(
//           child: Text(
//             'No slots available',
//             style: primaryTextStyle(fontSize: 12),
//           ),
//         );
//       }
//
//       return SizedBox(
//         height: 200,
//         child: GridView.builder(
//           itemCount: coachController.coachTimeAvailability.result!.slots!.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             childAspectRatio: 2.5,
//             crossAxisSpacing: 8,
//             mainAxisSpacing: 10,
//           ),
//           itemBuilder: (context, index) {
//             String slotId = coachController.coachTimeAvailability.result!.slots![index].id.toString();
//             bool isSelected = coachController.selectedSlotId.value == slotId;
//             return SelectTimeContainer(
//               onTap: () {
//                 coachController.selectedSlotId.value = slotId;
//               },
//               isSelected: isSelected,
//               time: coachController.coachTimeAvailability.result!.slots![index].formattedStartTime.toString(),
//             );
//           },
//         ),
//       );
//     });
//   }
//
//   Row _buildCoachingOptions(CoachController coachController) {
//     return Row(
//       children: [
//         CoachingOption(
//           label: "Individual Coaching",
//           isSelected: coachController.isAvailable.value == 'Individual Coaching',
//           onChanged: (bool? value) {
//             coachController.isAvailable.value = 'Individual Coaching';
//           },
//         ),
//         CoachingOption(
//           label: "Group Coaching",
//           isSelected: coachController.isAvailable.value == 'Group Coaching',
//           onChanged: (bool? value) {
//             coachController.isAvailable.value = 'Group Coaching';
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBookCoachButton(CoachController coachController,context) {
//     return kTextButton(
//       onPressed: () {
//         coachController.createSession(context);
//       },
//       btnText: 'BOOK A COACH',
//     );
//   }
// }
