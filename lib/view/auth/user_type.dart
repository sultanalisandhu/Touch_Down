/// user type no need

// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:touch_down/utils/asset_utils.dart';
// import 'package:touch_down/utils/constants.dart';
// import 'package:touch_down/utils/extensions.dart';
// import 'package:touch_down/widgets/k_buttons.dart';
//
// class UserType extends StatefulWidget {
//   const UserType({Key? key}) : super(key: key);
//
//   @override
//   State<UserType> createState() => _UserTypeState();
// }
//
// class _UserTypeState extends State<UserType> {
//   String? selectedRole;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: mQ.height,
//         width: mQ.width,
//         padding: EdgeInsets.only(top: 12.h,left: 12,right: 12),
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage(ImgUtils.bgImg))
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             roleCheckboxListTile('Sign up As Coach'),
//             roleCheckboxListTile('Player'),
//             roleCheckboxListTile('Entertainment'),
//             SizedBox(height: 20),
//             Align(
//               alignment: Alignment.center,
//               child: kTextButton(
//                 onPressed: (){},
//                 textColor: AppColor.blackColor,
//                 btnText: 'Next',
//                 height: 5.h,
//                 width: 90.w,
//
//
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text('Selected User Type'),
//                       content: Text(selectedRole ?? 'None'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('OK'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget roleCheckboxListTile(String role) {
//     return Card(
//       color: AppColor.whiteColor.withOpacity(0.5),
//       child: CheckboxListTile(
//         checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//         side: BorderSide(color: selectedRole == role ? AppColor.primaryColor : AppColor.whiteColor,),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),
//             side: BorderSide(width: selectedRole == role ? 2 : 1, color: selectedRole == role ? AppColor.primaryColor : Colors.transparent)),
//         title: Text(role,style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: selectedRole == role ?AppColor.primaryColor:AppColor.blackColor),),
//         value: selectedRole == role,
//         activeColor: AppColor.primaryColor,
//         onChanged: (bool? value) {
//           setState(() {
//             if (value == true) {
//               selectedRole = role;
//             } else {
//               selectedRole = null;
//             }
//           });
//         },
//       ),
//     );
//   }
// }
//
