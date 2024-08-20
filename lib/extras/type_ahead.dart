// import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:touch_down/utils/constants.dart';
// import 'package:touch_down/utils/extensions.dart';
// import 'package:touch_down/extras/app_data_class.dart';
//
// class TypeAhead extends StatelessWidget {
//   TypeAhead({super.key});
//
//
//   final TextEditingController _locationController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: mQ.height*0.1,
//       width: mQ.width,
//       child: TypeAheadField<City>(
//         suggestionsCallback: (search) => AppData.find(search),
//         controller: _locationController,
//
//         builder: (context, controller, focusNode) {
//           return TextFormField(
//             controller: controller,
//             focusNode: focusNode,
//             style: primaryTextStyle(fontSize: 12),
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       color: AppColor.lightGreyColor, width: 0.1.h),
//                   borderRadius: BorderRadius.circular(0.8.h)),
//               focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       color: AppColor.lightGreyColor, width: 0.1.h),
//                   borderRadius: BorderRadius.circular(0.8.h)),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(0.8.h)),
//               contentPadding: EdgeInsets.symmetric(
//                 vertical: 1.4.h,
//                 horizontal: 1.6.h,
//               ),
//               suffixIconConstraints: BoxConstraints.tightFor(
//                 width: 5.0.h,
//                 height: 5.h,
//               ),
//               hintStyle: primaryTextStyle(
//                 fontSize: 10,
//                   color: AppColor.blackColor),
//               suffixIcon: const Icon(
//                 Icons.keyboard_arrow_down_outlined,
//                 color: AppColor.primaryColor,
//               ),
//               isCollapsed: true,
//               filled: true,
//               fillColor: AppColor.whiteColor,
//               hintText: 'Enter location',
//               enabled: true,
//             ),
//           );
//         },
//         itemBuilder: (context, city) {
//           return _buildCityInfo(city);
//         },
//         onSelected: (city) {
//           _locationController.text = city.name;
//         },
//       ),
//     );
//   }
//
//   Widget _buildCityInfo(city) {
//     return Column(
//       children: [
//         2.height,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text('${city.name}, ',style: primaryTextStyle(fontSize: 10),),
//             Text(city.country,style: primaryTextStyle(fontSize: 10),),
//           ],
//         ),
//         const Divider(
//           height: 0,
//           color: AppColor.primaryColor,
//         ),
//       ],
//     ).paddingSymmetric(horizontal: 2.h,);
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
// // class TypeAhead extends StatelessWidget {
// //   TypeAhead({super.key});
// //
// //   final TextEditingController _locationController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: mQ.height * 0.08,
// //       width: mQ.width,
// //       child: TypeAheadField<City>(
// //         suggestionsCallback: (search) {
// //           return AppData.find(search);
// //         },
// //         itemBuilder: (context, city) {
// //           return _buildCityInfo(city);
// //         },
// //         onSelected: (city) {
// //           _locationController.text = city.name;
// //         },
// //         builder: (context, controller, focusNode) {
// //           return TextFormField(
// //             controller: _locationController, // Use _locationController here
// //             focusNode: focusNode,
// //             style: primaryTextStyle(fontSize: 16),
// //             decoration: InputDecoration(
// //               enabledBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   color: AppColor.primaryColor,
// //                   width: 0.1.h,
// //                 ),
// //                 borderRadius: BorderRadius.circular(0.8.h),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderSide: BorderSide(
// //                   color: AppColor.lightGreyColor,
// //                   width: 0.1.h,
// //                 ),
// //                 borderRadius: BorderRadius.circular(0.8.h),
// //               ),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(0.8.h),
// //               ),
// //               contentPadding: EdgeInsets.symmetric(
// //                 vertical: 1.4.h,
// //                 horizontal: 1.6.h,
// //               ),
// //               suffixIconConstraints: BoxConstraints.tightFor(
// //                 width: 5.0.h,
// //                 height: 5.h,
// //               ),
// //               hintStyle: primaryTextStyle(
// //                 color: AppColor.primaryColor.withOpacity(0.7),
// //               ),
// //               suffixIcon: const Icon(
// //                 Icons.keyboard_arrow_down_outlined,
// //                 color: AppColor.primaryColor,
// //               ),
// //               isCollapsed: true,
// //               filled: true,
// //               fillColor: AppColor.whiteColor,
// //               hintText: 'Enter location',
// //               enabled: true,
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _buildCityInfo(City city) {
// //     return Column(
// //       children: [
// //         10.height,
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           crossAxisAlignment: CrossAxisAlignment.end,
// //           children: [
// //             Text(city.name),
// //             Text(
// //               city.country,
// //               style: primaryTextStyle(color: AppColor.lightGreyColor),
// //             ),
// //           ],
// //         ),
// //         Divider(
// //           color: AppColor.lightGreyColor.withOpacity(0.4),
// //         ),
// //       ],
// //     ).paddingSymmetric(horizontal: 2.h);
// //   }
// // }
