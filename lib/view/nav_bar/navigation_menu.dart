import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/more_ui/search_venue_screen.dart';
import 'package:touch_down/view/coach_ui/coach_profile_screen.dart';
import 'package:touch_down/view/home_ui/home_screen.dart';
import 'package:touch_down/view/profile_ui/user_profile_screen.dart';
import 'package:touch_down/view/store_ui/store_screen.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';


class CustomBottomBar extends StatelessWidget {
   CustomBottomBar({super.key});
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _pages = [
     HomeScreen(),
     CoachProfileScreen(),
    const SearchVenueScreen(),
    StoreScreen(),
    UserProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      body: _pages[_currentIndex.value],
      bottomNavigationBar: Container(
        height: 9.h,
        width: mQ.width,
        decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return InkWell(
              onTap: () {
                _currentIndex.value = index;
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18.h),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (index == _currentIndex.value)
                      Container(
                        height: 2.h,
                        width: 2.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.yellowColor
                        ),
                      )else const SizedBox.shrink(),
                    1.height,
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        AppColor.blackColor,
                        BlendMode.srcIn,
                      ),
                      child: showSvgIconWidget(
                        height:2.5.h,
                        iconPath: listOfIcons[index],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    ) );
  }
  List listOfIcons = [
    IconUtils.homeIcon,
    IconUtils.coachIcon,
    IconUtils.menuIcon,
    IconUtils.storeIcon,
    IconUtils.profileIcon,
  ];
}

