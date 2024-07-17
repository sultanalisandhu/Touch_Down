// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:touch_down/utils/constants.dart';
// import 'package:touch_down/utils/extensions.dart';
// import 'package:touch_down/utils/asset_utils.dart';
// import 'package:touch_down/view/nav_bar/navigation_menu.dart';
// import 'package:touch_down/widgets/k_bg_img.dart';
// import 'package:touch_down/widgets/k_buttons.dart';
// import 'package:touch_down/widgets/k_otp_textfield.dart';
// import 'package:touch_down/widgets/k_textfields.dart';
//
// class OtpScreen extends StatelessWidget {
//   const OtpScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         const BackgroundImage(),
//         Scaffold(
//             backgroundColor: Colors.transparent,
//             body: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                    const Align(
//                     alignment: Alignment.center,
//                     child:  Image(image: AssetImage(ImgUtils.logo),fit: BoxFit.cover,),
//                   ),
//                   60.height,
//                   Text('Enter The Mobile Number:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
//                   KTextField(
//                     context: context,
//                     keyboardType: TextInputType.phone,
//                   ),
//                   30.height,
//                   Text('Enter OTP:',style: primaryTextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.lightGreyColor),),
//                   10.height,
//                   const PinputExample(),
//                   10.height,
//                   Text('Didn’t receive OTP ?  Resend OTP in 20 secs ',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.lightGreyColor),),
//                   60.height,
//                   Align(
//                     alignment: Alignment.center,
//                     child: kTextButton(
//                       onPressed: (){
//                         Get.to(()=> CustomBottomBar());
//                       },
//                       btnText: 'LOG IN',
//                       color: AppColor.primaryColor,
//                       width: 200,
//                       borderRadius: 26,
//
//                     ),
//                   ),
//
//                 ],
//               ).paddingSymmetric(horizontal: 30,vertical: 20),
//             )
//         )
//       ],
//     );
//   }
// }
