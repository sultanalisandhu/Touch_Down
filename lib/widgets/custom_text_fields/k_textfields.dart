import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';


import 'package:flutter/material.dart';
import 'package:touch_down/utils/constants.dart';

class KTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;
  ///coach registration parameter
  final Color? hintTextColor;
  final Color? borderColor;
  final Color? textColor;
  final int? maxLength;

  const KTextField({
    super.key,
    required this.context,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType,
    this.controller,
    this.obSecureText,
    this.suffixOnTap,
    this.hintTextColor,
    this.borderColor,
    this.textColor,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColor.greyColor,
      maxLines: 1,
      style: primaryTextStyle(color: textColor ?? AppColor.lightGreyColor, fontSize: 12.0,fontWeight: FontWeight.w500),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obSecureText ?? false,
      onTapOutside: (event) {context.dismissKeyBoard();},
      inputFormatters: maxLength != null
          ? [LengthLimitingTextInputFormatter(maxLength)]
          : null,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 36.0
        ),
        suffixIconConstraints: const BoxConstraints(
            maxHeight: 25.0,
            maxWidth: 30.0
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(icon: Icon(suffixIcon, color: borderColor ?? AppColor.greyColor,),onPressed: suffixOnTap,)
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 2),
        hintStyle: primaryTextStyle(color: hintTextColor ?? AppColor.greyColor, fontSize: 11.0),
        filled: true,
        isDense: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor ?? AppColor.lightGreyColor, width: 1.0),),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor ?? AppColor.lightGreyColor, width: 1.0),),
        errorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
        focusedErrorBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0),),
      ),
    );
  }
}

class GetTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final Function()? fieldOnTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

   const GetTextField({super.key,
     required this.context,
     this.hintText,
     this.prefixIcon,
     this.suffixIcon,
     this.validator,
     this.keyboardType,
     this.controller,
     this.obSecureText,
     this.suffixOnTap,
     this.onChanged,
     this.focusNode,
     this.fieldOnTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColor.primaryColor,
      maxLines: 1,
      style: primaryTextStyle(color: AppColor.blackColor, fontSize: 10.0),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obSecureText??true,
      onTapOutside: (event) {context.dismissKeyBoard();},
      onChanged: onChanged,
      focusNode: focusNode,
      onTap: fieldOnTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColor.primaryColor,
            size: 30,
          ),
          onPressed: suffixOnTap,
        )
            : null,
        contentPadding: const EdgeInsets.all(12.0),
        hintStyle: primaryTextStyle(color: AppColor.greyColor, fontSize: 10.0),
        filled: true,
        isDense: true,
        fillColor: Colors.transparent,
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide:  const BorderSide(color:AppColor.primaryColor, width: 1.5),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide:  BorderSide(color: AppColor.primaryColor, width: 1.5,),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide:  BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide:  BorderSide(color: Colors.red, width: 1.0),
        ),
      ),
    );
  }
}

class DescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;
  const DescriptionTextField({
    super.key,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      child: TextField(
        onChanged: (value) {},
        onTapOutside: (event) {FocusScope.of(context).unfocus();},
        maxLines: 6,
        style:  primaryTextStyle(fontSize: 12,),
        controller: controller,
        cursorColor: AppColor.blackColor,
        decoration:  InputDecoration(
            contentPadding: EdgeInsets.all(15, ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Description: ',
            hintStyle: primaryTextStyle(fontSize: 12, color: AppColor.greyColor)),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  const PrimaryContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      margin: EdgeInsets.only(top: 2.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular( 20),
        border: Border.all(color: AppColor.primaryColor)
      ),
      child: child,
    );
  }
}