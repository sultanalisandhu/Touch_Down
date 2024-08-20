import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:touch_down/controller/auth_controller.dart';


class CountryCodePickerWidget extends StatelessWidget {
  final AuthController controller;

  CountryCodePickerWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (cc) => controller.setSelectedPhone(cc.dialCode!),
      initialSelection: 'IN',
      showCountryOnly: true,
      showDropDownButton: true,
      showFlag: true,
      showOnlyCountryWhenClosed: true,
      favorite: const ['+49', '+92'],
      builder: (countryCode) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            countryCode.toString(),
            style:  primaryTextStyle(
              fontSize: 11,
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}


Widget roleContainer({
  String? title,
  String? iconPath,
  Function()? onTap,
}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          top: BorderSide(
            color: AppColor.whiteColor,
            width: 3.0,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
          title: Text(
            title!,
            style: primaryTextStyle(fontSize: 12),
          ),
          leading: showSvgIconWidget(iconPath: iconPath!,color: AppColor.blackColor,height: 25,width: 25),
          trailing: showSvgIconWidget(iconPath: IconUtils.arrowUpRight,color: AppColor.blackColor)
      ),
    ),
  );
}

