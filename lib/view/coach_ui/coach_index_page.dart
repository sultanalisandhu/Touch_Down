import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/controller/geo_location_controller.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/view/profile_ui/coach_list_widget.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/coach_profile_screen.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class CoachIndexPage extends StatelessWidget {
  CoachIndexPage({super.key});
  final RxInt selectedIndex = 0.obs;
  final RxInt selectedSportIndex = (0).obs;

  @override
  Widget build(BuildContext context) {
    final CoachController coachController = Get.find<CoachController>(tag: 'coachController');
    final LocationController locationController = Get.find<LocationController>(tag: 'locationController');
    return Obx(() => Scaffold(
            appBar: kAppBar(titleText: 'Search Coach'),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      showSvgIconWidget(iconPath: IconUtils.filterIconb),
                      Text(
                        'Filter',
                        style: primaryTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                addMatchContainer(
                  isSelected: selectedIndex.value == 0,
                  onTap: () {
                    selectedIndex.value = 0;
                  },
                  title: 'Select Sports',
                ),
                addMatchContainer(
                  isSelected: selectedIndex.value == 1,
                  onTap: () {
                    selectedIndex.value = 1;
                    coachController.getCoachByLocation(locationController.currentAddress.value);
                  },
                  title: 'Based on Locality',
                ),
              ],
            ),
            Divider(color: AppColor.primaryColor, height: 5.h),
            if (selectedIndex.value == 0) ...[
              Obx(() {
                final sportsModel = coachController.homeController.allSportsModel;
                if (sportsModel.result == null || sportsModel.result!.data == null) {
                  return SizedBox(
                    height: 12.h,
                    child: kCircularLoading(),
                  );
                }
                final sportsData = sportsModel.result!.data!;
                return coachController.homeController.isLoading
                    ? kCircularLoading()
                    : SizedBox(
                  height: 13.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(sportsData.length, (index) {
                      final sport = sportsData[index];
                      final isSelected = selectedSportIndex.value == index;
                      return Expanded(
                        child: GameContainer(
                          onTap: () {
                            selectedSportIndex.value = index;
                            final sportId = sportsData[index].id;
                            coachController.getCoachBySportId(sportId!);
                          },
                          iconPath: ApiRoutes.baseUrl + sport.avatar.toString(),
                          sportName: sport.name ?? 'Loading',
                          textColor: isSelected
                              ? AppColor.primaryColor
                              : AppColor.blackColor,
                        ),
                      );
                    }),
                  ),
                );
              }),
              Divider(color: AppColor.primaryColor, height: 5.h),
              /// coaches list based on the sport id
              Expanded(
                child: Obx(() {
                  if (coachController.isLoading) {
                    return kCircularLoading();
                  }

                  final coachesResult = coachController.coachBySportId.result;
                  if (coachesResult == null ||
                      coachesResult.coaches == null ||
                      coachesResult.coaches!.isEmpty) {
                    return const Center(
                      child: Text('No coaches found for the selected sport.'),
                    );
                  }

                  final coaches = coachesResult.coaches!;
                  return ListView.builder(
                    itemCount: coaches.length,
                    itemBuilder: (context, index) {
                      final coach = coaches[index];

                      return CoachProfileCard(
                        onTap: () async{
                          printWarning('Tapped from coach index page ${coach.user!.id.toString()}');
                          Get.to(() => CoachProfileScreen());
                          await coachController.getUserById(coach.user!.id.toString());


                        },
                        coachImg: ApiRoutes.baseUrl + (coach.user?.avatar ?? ''),
                        coachName: coach.user?.name ?? 'Unknown',
                        coachLocation: coach.location ?? 'Location not available',
                        coachSportImg: (coach.sport?.avatar != null && coach.sport!.avatar!.isNotEmpty)
                            ? ApiRoutes.baseUrl + coach.sport!.avatar.toString()
                            : 'https://img.freepik.com/free-vector/loading-circles-blue-gradient_78370-2646.jpg?w=900&t=st=1724219055~exp=1724219655~hmac=60d875137f28fae2e436894e7691eb899fa601505880eff1f197e3198b1f4607',
                        rating: coach.rating ?? 0,
                      );
                    },
                  );
                }),
              ),
            ]
            else ...[
              // coaches list based on the user location
              Expanded(
                child: Obx(() {
                  if(coachController.isLoading){
                    return kCircularLoading();
                  }
                  final coachesByLocation = coachController.coachByLocation.result?.coaches;
                  printWarning(coachesByLocation.toString());
                  if (coachesByLocation==null) {
                    return const Center(child: Text('No coaches found at  that location.'));
                  }
                  return  ListView.builder(
                    itemCount: coachesByLocation.length,
                    itemBuilder: (context, index) {
                      final coach = coachesByLocation[index];
                      final coachAvatar = coach.user?.avatar;
                      final coachSportImgAvatar = ApiRoutes.baseUrl+ coach.sport!.avatar.toString();
                      final coachName = coach.user?.name ?? 'Unknown';
                      final coachLocation = coach.location ?? 'Location not available';
                      final coachRating = coach.rating ?? 0;
                      return CoachProfileCard(
                        onTap: (){
                          Get.to(()=> CoachProfileScreen());
                        },
                        coachImg: coachAvatar != null
                            ? ApiRoutes.baseUrl + coachAvatar
                            : 'https://img.freepik.com/free-vector/loading-circles-blue-gradient_78370-2646.'
                            'jpg?w=900&t=st=1724219055~exp=1724219655~hmac=60d875137f28fae2e436894e7691eb899fa601505880eff1f197e3198b1f4607',
                        coachName: coachName,
                        coachLocation: coachLocation,
                        coachSportImg: coachSportImgAvatar,
                        rating: coachRating,
                      );
                    },
                  );
                }),
              )
            ]
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
