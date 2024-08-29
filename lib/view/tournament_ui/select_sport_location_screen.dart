import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/controller/tournament_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/text_capital_ext.dart';
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class SelectSportWidget extends StatelessWidget {
  final HomeController homeController;
  final TournamentController tournamentController;
  final TextEditingController sportController;

  const SelectSportWidget({
    super.key,
    required this.homeController,
    required this.tournamentController,
    required this.sportController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

class SelectLocationWidget extends StatelessWidget {
  final TournamentController tournamentController;

  const SelectLocationWidget({
    super.key,
    required this.tournamentController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        GetTextField(
          context: context,
          hintText: 'Select Location',
          controller: tournamentController.tournamentLocationController,
          obSecureText: false,
          suffixIcon: Icons.keyboard_arrow_down_rounded,
          fieldOnTap: () {
            tournamentController.setIsLocationTapped = true;
          },
          onChanged: (value) {
            tournamentController.filterGrounds(value);
          },
        ),
        Obx(() {
          if (tournamentController.isLocationTextFieldTapped) {
            if (tournamentController.filteredGrounds.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tournamentController.filteredGrounds.length,
                itemBuilder: (context, index) {
                  final ground = tournamentController.filteredGrounds[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(ApiRoutes.baseUrl + ground.avatar.toString()),
                        ),
                        title: Text(ground.name!.toCapitalize, style: primaryTextStyle(fontSize: 12)),
                        subtitle: Text(ground.location!.toCapitalize, style: primaryTextStyle(fontSize: 10)),
                        trailing: Text('Rating: ${ground.rating}', style: primaryTextStyle(fontSize: 10)),
                        onTap: () {
                          tournamentController.tournamentLocationController.text = ground.location ?? '';
                          tournamentController.setIsLocationTapped = false;
                          tournamentController.filteredGrounds.clear();
                        },
                      ),
                      Divider(
                        indent: 3.w,
                        endIndent: 3.w,
                        color: AppColor.primaryColor,
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(child: Text("No grounds found",style: primaryTextStyle(fontSize: 12),));
            }
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}

