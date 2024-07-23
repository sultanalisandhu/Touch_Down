import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';

class ImageMover extends StatefulWidget {
  const ImageMover({super.key});

  @override
  State<ImageMover> createState() => _ImageMoverState();
}

class _ImageMoverState extends State<ImageMover> {
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
    timer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (currentIndex < carouselPictures.length - 1) {
        controller.animateToPage(currentIndex.value + 1, duration: const  Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        timer.cancel();
      }
    });
  }

  final List<String> carouselPictures=[
    ImgUtils.blueTshirt,
    ImgUtils.greenTshirt,
    ImgUtils.sliderImg,
    ImgUtils.sliderImg2
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: IconButton(onPressed: (){
              if (currentIndex > 0) {
                setState(() {
                  currentIndex--;
                });
                controller.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              }

            },
              icon: Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: AppColor.primaryColor,),)),
        Expanded(
          flex: 13,
          child: Container(
            height: mQ.height / 5,
            width: mQ.width,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex.value = index;
                      });
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
                        activeDotColor: AppColor.primaryColor,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(child: IconButton(onPressed: (){
          if (currentIndex < carouselPictures.length - 1) {
            setState(() {
              currentIndex++;
            });
            controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          }
        },
          icon: const Icon(Icons.arrow_forward_ios_outlined,size: 20,color: AppColor.primaryColor,),)),

      ],
    );
  }
}
