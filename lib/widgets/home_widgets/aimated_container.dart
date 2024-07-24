import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';


class KAnimatedContainer extends StatelessWidget {

   KAnimatedContainer({super.key});
  final RxBool selected = false.obs;

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>AnimatedPositioned(
      height: selected.value ? 25.0.h : 5.0.h,
      width: selected.value ? 11.0.w : 5.0.w,
      top: selected.value ? 5.0.h : 10.h,
      right: 0,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
            selected.value = !selected.value;
        },
        child: Container(
          padding: EdgeInsets.only(top: 0.5.h),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(selected.value ? 2.h : 4.h),
              bottomLeft: Radius.circular(selected.value ? 2.h : 4.h),
            ),
          ),
          child: selected.value
              ? SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                showSvgIconWidget(onTap: (){}, iconPath: IconUtils.chatIcon,height: 3.h,width: 3.w),
                2.height,
                showSvgIconWidget(onTap: (){}, iconPath: IconUtils.shareIcon,height: 3.h,width: 3.w),
                2.height,
                showSvgIconWidget(onTap: (){}, iconPath: IconUtils.rateIcon,height: 3.h,width: 3.w),
                2.height,
                showSvgIconWidget(onTap: (){}, iconPath: IconUtils.bellIcon,height: 3.h,width: 3.w),
                IconButton(
                  onPressed: () {
                    selected.value = !selected.value;
                  },
                  icon: Icon(Icons.keyboard_arrow_up_outlined,size: 4.h,),
                ),
              ],
            ),
          )
              : Icon( Icons.arrow_back_ios_new_rounded,size: 2.h,),
        ),
      ),
    ));
  }
}


