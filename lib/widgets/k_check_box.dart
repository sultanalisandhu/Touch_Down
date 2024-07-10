import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';

class CustomCheckbox extends StatelessWidget {
   CustomCheckbox({super.key});

  RxBool isChecked = false.obs;
   // snoxid
   // proxil
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
          activeColor: Colors.red,
          side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(
              color: states.contains(MaterialState.selected) ? Colors.red : AppColor.lightGreyColor,
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
            style: primaryTextStyle(fontSize: 16.0,color: AppColor.lightGreyColor),
          ),
        ),
      ],
    ),
    );
  }
}
