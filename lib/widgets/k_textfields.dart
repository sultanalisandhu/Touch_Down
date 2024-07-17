import 'package:flutter/material.dart';
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
      maxLines: 1,
      style: primaryTextStyle(color: AppColor.lightGreyColor, fontSize: 20.0),
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
        contentPadding: const EdgeInsets.only(bottom: 10.0,top: 5),
        hintStyle: primaryTextStyle(color: AppColor.greyColor, fontSize: 16.0),
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