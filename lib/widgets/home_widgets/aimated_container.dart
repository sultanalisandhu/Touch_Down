import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';


class KAnimatedContainer extends StatelessWidget {
   KAnimatedContainer({super.key});
  final RxBool selected = false.obs;
  @override
  Widget build(BuildContext context) {
    return  Obx(()=>AnimatedPositioned(
      height: selected.value ? 27.0.h : 5.0.h,
      width: selected.value ? 50.0 : 20.0,
      top: selected.value ? 5.0.h : 10.h,
      right: 0,
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () {
            selected.value = !selected.value;
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(selected.value ? 16 : 40),
              bottomLeft: Radius.circular(selected.value ? 16 : 40),
            ),
          ),
          child: selected.value
              ? SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up_off_alt_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
                IconButton(
                  onPressed: () {
                    selected.value = !selected.value;
                  },
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
          )
              : Icon( Icons.arrow_back_ios_new_rounded),
        ),
      ),
    ));
  }
}


