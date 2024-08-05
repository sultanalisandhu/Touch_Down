import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/home_ui/cricket_home_screen.dart';
import 'package:touch_down/view/more_ui/book_venue_screen.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/drawer_content.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/k_drawer.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class BookVenueInnerScreen extends StatefulWidget {
  BookVenueInnerScreen({super.key});

  @override
  State<BookVenueInnerScreen> createState() => _BookVenueInnerScreenState();
}

class _BookVenueInnerScreenState extends State<BookVenueInnerScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: AppColor.primaryColor,
        //
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image Container
          Container(
            height: mQ.height / 3,
            width: mQ.width,
            padding: const EdgeInsets.only(bottom: 20,right: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://img.freepik.com/free-photo/view-empty-football-stadium_23-2151569873.jpg?t=st=1721625578~exp='
                  '1721629178~hmac=fab1a4c9dc45d56bb18093e979bd1dfc98a5efc1b4c9de56d85f886db5ab5c48&w=1800'))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 3 ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 2.h,
                    );
                  }),
                ),
                Text('4.1 (5 Reviews)', style: primaryTextStyle(fontSize: 8, fontWeight: FontWeight.w400,color: AppColor.whiteColor)),
              ],),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cricket Stadium - KanakaPura Road', style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  1.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on_sharp,color: AppColor.blackColor,),
                      1.width,
                      ///location text
                      Expanded(
                        child: Text('VG8R+ 6MG,judical layout second phase, jyotipuram, Bengalaru, Karnatka 56002',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                  1.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.access_time,color: AppColor.blackColor,),
                      1.width,
                      Text('8:00 Am - 5:00 Pm', style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  1.height,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: AppColor.primaryColor)
                    ),
                    child:  Text('View Location',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400),),
                  ),
                  2.height,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.containerGreyColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border(top: BorderSide(color: AppColor.primaryColor,width: 5))
                    ),
                    child: ExpansionTile(
                        title: Text('About the Venue',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                      children: [
                         Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                            ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
                          style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400),)
                      ],
                      expandedAlignment: Alignment.topLeft,

                      collapsedIconColor: AppColor.primaryColor,
                      iconColor: AppColor.primaryColor,
                      childrenPadding: EdgeInsets.all(12),
                      collapsedBackgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  1.height,
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.containerGreyColor,
                      borderRadius: BorderRadius.circular(16),
                      border: const Border(top: BorderSide(color: AppColor.primaryColor,width: 5))
                    ),
                    child: ExpansionTile(
                        title: Text('Amenities available',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                      children: [
                         Text(' The amenities can provide a better experience for guests by increasing comfort,'
                             ' making things easier, and generally providing a more restful and convenient stay.',
                          style: primaryTextStyle(fontSize: 8,fontWeight: FontWeight.w400),)
                      ],
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      collapsedIconColor: AppColor.primaryColor,
                      iconColor: AppColor.primaryColor,
                      childrenPadding: const EdgeInsets.all(12),
                      collapsedBackgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  15.height,
                  Align(
                    alignment: Alignment.center,
                    child: kTextButton(
                      onPressed: (){
                        Get.to(()=> BookVenueScreen());
                      },
                      btnText: 'BOOK VENUE',
                      color: AppColor.primaryColor,
                        textColor: AppColor.blackColor,
                      borderRadius: 22,
                      width: 50.w,
                      height: 5.h
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 15, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
