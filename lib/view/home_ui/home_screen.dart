import 'dart:async';

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

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late PageController controller;

   RxInt currentIndex=0.obs;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Sports', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Centauraus(
                            onTap: (){
                              Get.to(()=> CricketHomeScreen());
                            },
                            iconPath: ImgUtils.cricketImg, sportName: 'Cricket'),
                        Centauraus(onTap: (){}, iconPath: ImgUtils.footballImg, sportName: 'Football'),
                        Centauraus(onTap: (){}, iconPath: ImgUtils.badmintonImg, sportName: 'Badminton'),
                        Centauraus(onTap: (){}, iconPath: ImgUtils.tableTennisImg, sportName: 'Table Tennis'),
                      ],
                    ),
                   20.height,
                    Text('Recent News Updates', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return newsContainer(
                          updateName: 'News Update ${index + 1}',
                          newsDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        );
                      },
                    ),
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
