// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:touch_down/utils/constants.dart';
//
// // void main() {
// //   runApp(
// //     MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Colors.white,
// //           elevation: 0,
// //           title: const Text('Pinput Example'),
// //           centerTitle: true,
// //           titleTextStyle: const TextStyle(
// //             fontSize: 22,
// //             fontWeight: FontWeight.w600,
// //             color: Color.fromRGBO(30, 60, 87, 1),
// //           ),
// //         ),
// //         body: const FractionallySizedBox(
// //           widthFactor: 1,
// //           // You can also checkout the [PinputBuilderExample]
// //           child: PinputExample(),
// //         ),
// //       ),
// //     ),
// //   );
// // }
// //
// // /// This is the basic usage of Pinput
// // /// For more examples check out the demo directory
// class PinputExample extends StatefulWidget {
//   const PinputExample({Key? key}) : super(key: key);
//
//   @override
//   State<PinputExample> createState() => _PinputExampleState();
// }
//
// class _PinputExampleState extends State<PinputExample> {
//   late final SmsRetriever smsRetriever;
//   late final TextEditingController pinController;
//   late final FocusNode focusNode;
//   late final GlobalKey<FormState> formKey;
//
//   @override
//   void initState() {
//     super.initState();
//     formKey = GlobalKey<FormState>();
//     pinController = TextEditingController();
//     focusNode = FocusNode();
//
//     // /// In case you need an SMS autofill feature
//     // smsRetriever = SmsRetrieverImpl(
//     //   SmartAuth(),
//     // );
//   }
//
//   @override
//   void dispose() {
//     pinController.dispose();
//     focusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     final defaultPinTheme = PinTheme(
//       width: 55,
//       height: 55,
//       textStyle:  primaryTextStyle(
//         fontSize: 22,
//         color: AppColor.lightGreyColor,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(19),
//       ),
//     );
//
//     /// Optionally you can use form to validate the Pinput
//     return Form(
//       key: formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Directionality(
//             textDirection: TextDirection.ltr,
//             child: Pinput(
//               length: 4,
//               controller: pinController,
//               focusNode: focusNode,
//               defaultPinTheme: defaultPinTheme,
//               separatorBuilder: (index) => const SizedBox(width: 8),
//               validator: (value) {
//                 return value == '22222' ? null : 'Pin is incorrect';
//               },
//               hapticFeedbackType: HapticFeedbackType.lightImpact,
//               onCompleted: (pin) {
//                 debugPrint('onCompleted: $pin');
//               },
//               onChanged: (value) {
//                 debugPrint('onChanged: $value');
//               },
//               cursor: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 1,
//                     height: 30,
//                     color: AppColor.lightGreyColor,
//                   ),
//                 ],
//               ),
//               followingPinTheme:  defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   borderRadius: BorderRadius.circular(19),
//                   border: Border.all(color: AppColor.lightGreyColor),
//                 ),
//               ),
//               disabledPinTheme: defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   borderRadius: BorderRadius.circular(19),
//                   border: Border.all(color: AppColor.lightGreyColor),
//                 ),
//               ),
//               focusedPinTheme: defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   borderRadius: BorderRadius.circular(19),
//                   border: Border.all(color: AppColor.lightGreyColor),
//                 ),
//               ),
//               submittedPinTheme: defaultPinTheme.copyWith(
//                 decoration: defaultPinTheme.decoration!.copyWith(
//                   color: AppColor.primaryColor,
//                   borderRadius: BorderRadius.circular(19),
//                   border: Border.all(color: Colors.transparent),
//                 ),
//               ),
//               errorPinTheme: defaultPinTheme.copyBorderWith(
//                 border: Border.all(color: Colors.redAccent),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               focusNode.unfocus();
//               formKey.currentState!.validate();
//             },
//             child: const Text('Validate'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // /// You, as a developer should implement this interface.
// // /// You can use any package to retrieve the SMS code. in this example we are using SmartAuth
// // class SmsRetrieverImpl implements SmsRetriever {
// //   const SmsRetrieverImpl(this.smartAuth);
// //
// //   final SmartAuth smartAuth;
// //
// //   @override
// //   Future<void> dispose() {
// //     return smartAuth.removeSmsListener();
// //   }
// //
// //   @override
// //   Future<String?> getSmsCode() async {
// //     final signature = await smartAuth.getAppSignature();
// //     debugPrint('App Signature: $signature');
// //     final res = await smartAuth.getSmsCode(
// //       useUserConsentApi: true,
// //     );
// //     if (res.succeed && res.codeFound) {
// //       return res.code!;
// //     }
// //     return null;
// //   }
// //
// //   @override
// //   bool get listenForMultipleSms => false;
// // }