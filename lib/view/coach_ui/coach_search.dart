import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/view/profile_ui/coach_list_widget.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class CoachSearch extends StatelessWidget {
   CoachSearch({super.key});
  final RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        appBar: kAppBar(titleText: 'Search Coach'),
        body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                showSvgIconWidget(iconPath: IconUtils.filterIconb),
                Text('Filter',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
              ],),
            ),
            addMatchContainer(
                isSelected: selectedIndex.value==0,
                onTap: (){
                  selectedIndex.value=0;
                },
                title: 'Select Sports'
            ),
            addMatchContainer(
                isSelected: selectedIndex.value==1,
                onTap: (){
                  selectedIndex.value=1;
                },
                title: 'Based on Locality'
            ),
          ],),
            Divider(color: AppColor.primaryColor,height: 5.h,),
            Expanded(
              child: ListView.builder(
                  itemCount: 9,
                  itemBuilder: (context,index){
                return CoachProfileCard();
              }),
            )
        ],),
      ),)
    );
  }
}
