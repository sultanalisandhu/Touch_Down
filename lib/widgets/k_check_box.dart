import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';

class CustomCheckbox extends StatelessWidget {
   CustomCheckbox({super.key});

  RxBool isChecked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked.value,
          onChanged: (bool? value) {
              isChecked.value = value!;
          },
          checkColor: Colors.white,
          activeColor: AppColor.primaryColor,
          side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(MaterialState.selected) ? AppColor.primaryColor : AppColor.lightGreyColor,
              width: 1.5,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          ),
        ),
        Flexible(
          child: Text(
            "I agree with the Terms and Condition and the Privacy Policy",
            maxLines: 2,
            style: primaryTextStyle(fontSize: 10.0,color: AppColor.lightGreyColor),
          ),
        ),
      ],
    ),
    );
  }
}
