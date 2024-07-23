import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/asset_utils.dart';

class HomeController extends GetxController {
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  Timer? timer;

  final List<String> carouselPictures = [
    ImgUtils.sliderImg,
    ImgUtils.welcomeImage,
    ImgUtils.bgImg,
    ImgUtils.sliderImg2
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex.value < carouselPictures.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        pageController.jumpToPage(0);
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
