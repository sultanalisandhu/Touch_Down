import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_down/utils/constants.dart';

class CustomImageSlider extends StatelessWidget {
  final PageController controller;
  final int imagesLength;
  final List<String> images;
  final ValueChanged<int> onPageChanged;

  const CustomImageSlider({
    super.key,
    required this.controller,
    required this.imagesLength,
    required this.images,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mQ.height / 3,
      width: mQ.width,
      decoration: const BoxDecoration(
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
              onPageChanged: onPageChanged,
              itemCount: imagesLength,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            Positioned(
              bottom: 10.0,
              child: SmoothPageIndicator(
                controller: controller,
                count: imagesLength,
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
