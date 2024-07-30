import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/utils/constants.dart';

class PinCodeFields extends StatefulWidget {
  final AuthController controller;
   PinCodeFields({Key? key, required this.controller}) : super(key: key);

  @override
  State<PinCodeFields> createState() => _PinCodeFieldsState();
}
class _PinCodeFieldsState extends State<PinCodeFields> {
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();

  }

  @override
  void dispose() {
    // authController.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle:  primaryTextStyle(
        fontSize: 22,
        color: AppColor.lightGreyColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: widget.controller.pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) =>  SizedBox(width: 2.w),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1,
                    height: 30,
                    color: AppColor.lightGreyColor,
                  ),
                ],
              ),
              followingPinTheme:  defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              disabledPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Colors.transparent),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class UpdatePinCodeFields extends StatefulWidget {
  AuthController controller;
   UpdatePinCodeFields({Key? key, required this.controller}) : super(key: key);

  @override
  State<UpdatePinCodeFields> createState() => _UpdatePinCodeFieldsState();
}

class _UpdatePinCodeFieldsState extends State<UpdatePinCodeFields> {

  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    focusNode = FocusNode();

  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle:  primaryTextStyle(
        fontSize: 22,
        color: AppColor.lightGreyColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              controller: widget.controller.updatedPinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) =>  SizedBox(width: 2.w),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1,
                    height: 30,
                    color: AppColor.lightGreyColor,
                  ),
                ],
              ),
              followingPinTheme:  defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              disabledPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: AppColor.lightGreyColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: Colors.transparent),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
