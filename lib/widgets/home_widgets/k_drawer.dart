import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';

import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/more_ui/pick_drop_screen.dart';
import 'package:touch_down/widgets/home_widgets/drawer_content.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';
Widget kDrawer({
  String? headingName,
}){
  return  Drawer(
    backgroundColor: AppColor.whiteColor,
    child: Container(
      color: AppColor.whiteColor,
            child: ListView(
        children: [
          DrawerHeader(child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 5.h,
                backgroundColor: Colors.blue,
                child: showSvgIconWidget(iconPath: IconUtils.profileIcon),
              ),
              1.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sanketh S',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  Text('+0923129999980',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                  Text('Bengaluru',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                ],
              ),
            ],
          ),),
          SizedBox(
           height: mQ.height,
            child: ListView.builder(
                itemCount: drawerList.length,
                itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  switch(drawerList[index].title)
                  {
                    case 'Pick up & Drop':Get.to(() => const PickDropScreen());
                    break;
                  }
                },
                titleTextStyle: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.blackColor),
                contentPadding: EdgeInsets.only(left: 10),
                title: Text(drawerList[index].title.toString()),
                shape: Border(bottom: BorderSide(color: Colors.green)),
              );
            }),
          ),


        ],
      ),
    ),
  );
}