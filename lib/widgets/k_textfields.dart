import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';


class KTextField extends StatelessWidget {
  final BuildContext context;
  final String? hintText;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final Function()? suffixOnTap;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;

   KTextField({super.key,
     required this.context,
     this.hintText,
     this.prefixIcon,
     this.suffixIcon,
     this.validator,
     this.keyboardType,
     this.controller,
     this.obSecureText,
     this.suffixOnTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColor.greyColor,
      cursorHeight: 2.h,
      maxLines: 1,
      style: primaryTextStyle(color: AppColor.lightGreyColor, fontSize: 11.0),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: obSecureText??true,
      onTapOutside: (event) {
        context.dismissKeyBoard();
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColor.greyColor,
          ),
          onPressed: suffixOnTap,
        )
            : null,
        contentPadding:  EdgeInsets.only(bottom: 0.2.h,top: 1.h),
        hintStyle: primaryTextStyle(color: AppColor.greyColor, fontSize: 10.0),
        filled: true,
        isDense: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        enabledBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color:AppColor.lightGreyColor, width: 1.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: AppColor.lightGreyColor, width: 1.0,),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder:const UnderlineInputBorder(
          borderSide:  BorderSide(color: Colors.red, width: 1.0),
        ),
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
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? obSecureText;

   GetTextField({super.key,
     required this.context,
     this.hintText,
     this.prefixIcon,
     this.suffixIcon,
     this.validator,
     this.keyboardType,
     this.controller,
     this.obSecureText,
     this.suffixOnTap});

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

      onTapOutside: (event) {
        context.dismissKeyBoard();
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(
            suffixIcon,
            color: AppColor.greyColor,
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
          borderSide:  BorderSide(color:AppColor.primaryColor, width: 1.5),
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