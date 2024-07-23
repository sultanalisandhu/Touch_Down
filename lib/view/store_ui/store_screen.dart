import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/home_ui/cricket_home_screen.dart';
import 'package:touch_down/widgets/home_widgets/drawer_content.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer.dart';
import 'package:touch_down/widgets/store_widgets/k_img_mover.dart';
import 'package:touch_down/widgets/store_widgets/k_img_slider.dart';
import 'package:touch_down/widgets/store_widgets/knew_arrival.dart';
import 'package:touch_down/widgets/store_widgets/store_widget.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: kDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image slider
          const ImageSlider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Categories', style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('View More', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                            5.width,
                            const Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,size: 15,)
                          ],
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        storeItems(
                          height: 200,
                            width: 200,
                            imgPath: 'https://img.freepik.com/free-photo/shirt-with-colorful-stripe-it-is-displayed-field_1340-37529.jpg?t=st=1721154299~exp=1721157899~hmac=f22'
                                '04a8c2d30cf0baed9627b112888bf935a8b30becb8a2fbab0bc66d8a76551&w=740',
                            itemName: 'Sports T-Shirts'
                        ),
                      10.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          storeItems(
                            height: 100,
                            imgPath: 'https://img.freepik.com/premium-photo/3d-rendered-photo-cap-design_916107-30582.jpg?w=826',
                            itemName: 'Caps'
                          ),
                          10.height,
                          storeItems(
                            height: 100,
                              imgPath: 'https://img.freepik.com/premium-photo/workout-soccer-sport-equipment-background-top-view-set-fitness-male-outfit-active-lifestyle-body-care-concept_116547-13231.jpg?w=740',
                              itemName: 'Accessories'
                          ),
                        ],),
                      )
                    ],),
                    20.height,
                    const ImageMover(),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New Arrivals', style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Text('View More', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                            5.width,
                            const Icon(Icons.arrow_forward_ios,color: AppColor.primaryColor,size: 15,)
                          ],
                        ),
                      ],
                    ),
                10.height,
                SizedBox(
                  width: mQ.width,
                  height: 280,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                    return kStoreItemContainer(
                        imgPath: 'https://img.freepik.com/free-photo/close-up-basketball-locker-with-equipment_23-2150847402.jpg?t=st=1721159801~exp=1721163401~hmac=364addaef6233e65abfa5135204354a0201bae07c9a851d7adb20ee61f916b05&w=360',
                        itemName: 'Sport Jersey',
                        itemPrice: '£799',
                        itemDescription: 'Half Slevee T- Shirt',
                        btnText: 'Add to Cart'
                    );
                  }),
                )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
