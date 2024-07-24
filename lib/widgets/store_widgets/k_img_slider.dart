import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
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
    ImgUtils.sliderImg3,
    ImgUtils.sliderImg,
    ImgUtils.sliderImg4,
    ImgUtils.sliderImg2
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mQ.height / 3,
      width: mQ.width,
      decoration: const BoxDecoration(
        color: Colors.blue,
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
              left: 10.0,
              top: mQ.height / 6.5,
              child: IconButton(
                icon:  Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.primaryColor,
                  size: 3.h,
                ),
                onPressed: () {
                  if (currentIndex > 0) {
                    setState(() {
                      currentIndex--;
                    });
                    controller.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
            ),
            Positioned(
              right: 10.0,
              top: mQ.height / 6.5,
              child: IconButton(
                icon:  Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColor.primaryColor,
                  size: 3.h,
                ),
                onPressed: () {
                  if (currentIndex < carouselPictures.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }
                },
              ),
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
    );
  }
}
