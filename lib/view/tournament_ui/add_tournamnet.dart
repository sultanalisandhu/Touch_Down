import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/controller/tournament_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/utils/extensions/text_capital_ext.dart';
import 'package:touch_down/view/tournament_ui/add_team.dart';
import 'package:touch_down/view/tournament_ui/select_sport_location_screen.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/date_range_picker.dart';
import 'package:touch_down/widgets/home_widgets/k_image_slider.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class AddTournamentScreen extends StatelessWidget {
  AddTournamentScreen({super.key});
  final HomeController homeController = Get.find<HomeController>(tag: 'homeController');
  final TournamentController tournamentController = Get.find<TournamentController>();
  final TextEditingController sportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomImageSlider(
            controller: homeController.pageController,
            imagesLength: homeController.carouselPictures.length,
            images: homeController.carouselPictures,
            onPageChanged: (index) {
              homeController.currentIndex.value = index;
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Sports',
                    style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  GetTextField(
                    context: context,
                    obSecureText: false,
                    hintText: 'Select Sport',
                    controller: sportController,
                    suffixIcon: Icons.keyboard_arrow_down_rounded,
                    fieldOnTap: () {
                      homeController.setIsTextFieldTapped = true;
                    },
                    onChanged: (value) {
                      homeController.filterSports(value);
                    },
                  ),
                  Obx(() {
                    if (homeController.isTextFieldTapped) {
                      if (homeController.filteredSports.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeController.filteredSports.length,
                          itemBuilder: (context, index) {
                            final sport = homeController.filteredSports[index];
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
                              trailing: Image(image: NetworkImage(ApiRoutes.baseUrl + sport.avatar.toString())),
                              title: Text(sport.name!.toCapitalize, style: primaryTextStyle(fontSize: 12)),
                              onTap: () {
                                sportController.text = sport.name ?? '';
                                homeController.setSelectedSport = sport;
                                tournamentController.selectedSportId.value = sport.id!;
                                homeController.setIsTextFieldTapped = false;
                              },
                            );
                          },
                        );
                      } else {
                        return  Center(child: Text("No sports found",style: primaryTextStyle(fontSize: 12),));
                      }
                    }
                    return const SizedBox.shrink();
                  }),
                  2.height,
                  Text(
                    'Tournament Name',
                    style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                  GetTextField(
                    context: context,
                  controller: tournamentController.tournamentNameController,
                  obSecureText: false,
                  hintText: 'Enter Name',
                  ),
                  2.height,
                  SelectLocationWidget(
                    tournamentController: tournamentController,
                  ),
                  2.height,
                  // select date range picker
                  SelectDateRangeExample(
                    controller: tournamentController,
                  ),
                  2.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Time",
                            style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                          ),
                          1.height,
                          Obx(()=> GestureDetector(
                              onTap: () => tournamentController.selectTime(context, true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tournamentController.startTime.value != null
                                          ? tournamentController.startTime.value!.format(context)
                                          : 'Select time',
                                      style: primaryTextStyle(fontSize: 10),
                                    ),
                                    const Icon(Icons.access_time),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Time",
                            style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                          ),
                          1.height,
                          Obx(()=> GestureDetector(
                              onTap: () => tournamentController.selectTime(context,false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      tournamentController.endTime.value != null
                                          ? tournamentController.endTime.value!.format(context)
                                          : 'Select time',
                                      style: primaryTextStyle(fontSize: 10),
                                    ),
                                    const Icon(Icons.access_time),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  4.height,
                  Align(
                    alignment: Alignment.center,
                    child: kTextButton(
                      onPressed: () {
                       tournamentController.addTournamentApi(tournamentController.selectedSportId.value);
                      },
                      btnText: 'Add Tournament',
                      textColor: AppColor.blackColor,
                      borderRadius: 26,
                      width: 50.w,
                      height: 5.h,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 2.h,vertical: 1.h),
            ),
          ),
        ],
      ),
    );
  }
}
