import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/coach_registration.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';

class CoachSportSelect extends StatelessWidget {
  CoachSportSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>(tag: 'homeController');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Sports',
          style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          if (homeController.allSportsModel.result == null) {
            return Center(child: CircularProgressIndicator());
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
                  Get.to(() => CoachRegistration(), arguments: {'sportId': homeController.allSportsModel.result!.data![i].id});
                },
              ),
            );
            if (i % 2 == 1 && i != homeController.allSportsModel.result!.data!.length - 1) {
              sportWidgets.add(Divider(color: Colors.green));
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
}
