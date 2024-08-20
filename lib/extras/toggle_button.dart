// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:touch_down/controller/auth_controller.dart';
// import 'package:touch_down/utils/constants.dart';
//
// class ToggleButtonsWidget extends StatelessWidget {
//   final AuthController controller;
//    ToggleButtonsWidget({super.key, required this.controller,});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Obx(() {
//           return Container(
//             decoration: BoxDecoration(
//               color:AppColor.whiteColor,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     if (!controller.isCustomerSelected.value) {
//                       controller.toggleSelection();
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     decoration: BoxDecoration(
//                       color: controller.isCustomerSelected.value
//                           ? AppColor.primaryColor
//                           : AppColor.whiteColor,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Text(
//                       'SIGN UP AS CUSTOMER',
//                       style: primaryTextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500,
//                         color: controller.isCustomerSelected.value
//                             ? Colors.white
//                             : Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (controller.isCustomerSelected.value) {
//                       controller.toggleSelection();
//                     }
//                   },
//                   child: Container(
//                     padding: const  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                     decoration: BoxDecoration(
//                       color: controller.isCustomerSelected.value
//                           ? AppColor.whiteColor
//                           : AppColor.primaryColor,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Text(
//                       'SIGN UP AS AGENT',
//                       style: primaryTextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.w500,
//                         color: controller.isCustomerSelected.value
//                             ? Colors.black
//                             : Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }
