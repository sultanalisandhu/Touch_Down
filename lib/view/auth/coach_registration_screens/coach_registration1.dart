import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/view/auth/coach_registration_screens/coach_registration2.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';

class CoachRegistration1 extends StatelessWidget {
  final String selectedRole;
  const CoachRegistration1({super.key, required this.selectedRole});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(HomeController()),
      tag: 'homeController',
      builder: (homeController) {
        return Scaffold(
          appBar: kAppBar(titleText: 'Select Sport'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Obx(() {
              if (homeController.allSportsModel.result == null) {
                return kCircularLoading();
              }
              List<Widget> sportWidgets = [];
              for (int i = 0; i < homeController.allSportsModel.result!.data!.length; i++) {
                sportWidgets.add(
                  GameContainer(
                    radius: 6.h,
                    imgRadius: 5.h,
                    sportName: homeController.allSportsModel.result!.data![i].name!,
                    iconPath: ApiRoutes.baseUrl+homeController.allSportsModel.result!.data![i].avatar!,
                    onTap: () {
                      Get.to(() => CoachRegistration2(
                        sportId: homeController.allSportsModel.result!.data![i].id.toString(),
                        userRole: selectedRole,
                      ),);
                    },
                  ),
                );
                if (i % 2 == 1 && i != homeController.allSportsModel.result!.data!.length - 1) {
                  sportWidgets.add(const Divider(color: AppColor.primaryColor));
                }
              }

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0.w,
                runSpacing: 2.0.h,
                children: sportWidgets,
              );
            }),
          ),
        );
      }
    );
  }
}
