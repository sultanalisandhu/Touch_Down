import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/home_widgets/drawer_content.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer.dart';

class CricketHomeScreen extends StatefulWidget {
  CricketHomeScreen({super.key});

  @override
  State<CricketHomeScreen> createState() => _CricketHomeScreenState();
}

class _CricketHomeScreenState extends State<CricketHomeScreen> {
  late PageController controller;

  RxInt currentIndex = 0.obs;
  RxInt selectedIndex = 0.obs;

  Timer? timer;

  @override
  void initState() {
    startTimer();
    controller= PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (currentIndex < carouselPictures.length - 1) {
        controller.animateToPage(currentIndex.value + 1, duration: const  Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        timer.cancel();
      }
    });
  }

  final List<String> carouselPictures=[
    ImgUtils.welcomeImage,
    ImgUtils.bgImg,
    ImgUtils.logo
  ];

  @override
  Widget build(BuildContext context) {
    return  Obx(()=>Scaffold(
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
            Container(
              height: mQ.height / 3,
              width: mQ.width,
              decoration: const BoxDecoration(
                color: Colors.blue, // Change to AppColor.primaryColor if defined
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      controller: controller,
                      onPageChanged: (index) {
                        currentIndex.value = index;
                      },
                      itemCount: carouselPictures.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          carouselPictures[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                      bottom: 10.0,
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: carouselPictures.length,
                        effect: const WormEffect(
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                          activeDotColor: Colors.blue, // Change to your active color
                          dotColor: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Match Score', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    20.height,
                    Container(
                      width: mQ.width,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.containerGreyColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                           children: [
                             Text('Semi Final Match', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                             Text('(Cricket grounds, Jp Nagar,Bangaluru)', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400,)),
                           ],
                          ),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('Team A', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                             Text('10/2 (10.2)', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400,)),
                           ],
                          ),
                          const Divider(
                            color: AppColor.primaryColor,
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Team B', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                              Text('Yet to Bat', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                            ],
                          ),
                          15.height,
                          Text('Team A won the task and Choose to Bat', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400,)),
                        ],
                      ),
                    ),
                    20.height,
                    Text('News Updates', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    10.height,
                    imgContainer(
                      imgPath: ImgUtils.cricketUpdateImg
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        addMatchContainer(
                          isSelected: selectedIndex.value==0,
                          onTap: (){
                            selectedIndex.value=0;
                          },
                          title: 'Add Match'
                        ),
                        addMatchContainer(
                          isSelected: selectedIndex.value==1,
                          onTap: (){
                            selectedIndex.value=1;
                          },
                          title: 'Add Team'
                        ),
                        addMatchContainer(
                          isSelected: selectedIndex.value==2,
                          onTap: (){
                            selectedIndex.value=2;
                          },
                          title: 'View Team'
                        )
                      ],
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return imgContainer(
                          imgPath: ImgUtils.cricketChampion,
                        );
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 15, vertical: 10)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
