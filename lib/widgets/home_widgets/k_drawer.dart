import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/asset_utils.dart';

import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/home_widgets/drawer_content.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class DrawerSc extends StatefulWidget {
  const DrawerSc({super.key});

  @override
  State<DrawerSc> createState() => _DrawerScState();
}

class _DrawerScState extends State<DrawerSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: AppColor.lightGreyColor,
            padding: EdgeInsets.only(left: 10),
            child: ListView(

              children: [
                DrawerHeader(child: Center(child: Text('Menu:'))),

                GestureDetector(
                    onTap: (){},
                    child: Text('Profile Details',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Add Tournament',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('My Stats',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Accessories',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Coaches',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Subscription',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Sports Option',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Book My Venue',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Pickup & Drop ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Language ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Share The App',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Rate The App',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                GestureDetector(
                    onTap: (){},
                    child: Text('Help Desk',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),

              ],
            ),
          ),
        ),

    );
  }
}
Widget kDrawer({
  String? headingName,
}){
  return  Drawer(
    backgroundColor: AppColor.whiteColor,
    child: Container(
      color: AppColor.yellowColor,
            child: ListView(
        children: [
          DrawerHeader(child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: showSvgIconWidget(iconPath: IconUtils.profileIcon),
              ),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sanketh S',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                  Text('+0923129999980',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                  Text('Bengaluru',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
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
                    case 'Pick up & Drop':Get.to(() => const ());
                    break;
                  }
                },
                titleTextStyle: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColor.blackColor),
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