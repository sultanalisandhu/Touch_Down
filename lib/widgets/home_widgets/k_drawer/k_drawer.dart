import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/auth_controller.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/view/coach_ui/coach_index_page.dart';
import 'package:touch_down/view/more_ui/pick_drop_screen.dart';
import 'package:touch_down/view/auth/coach_registration_screens/coach_registration1.dart';
import 'package:touch_down/view/tournament_ui/add_tournamnet.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/coach_drawer/add_availability.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/drawer_content.dart';

class kDrawer extends StatelessWidget {

  const kDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final CoachController coachController=Get.put(CoachController(),tag: 'coachController');

    return Drawer(
      backgroundColor: AppColor.whiteColor,
      child: Container(
        color: AppColor.whiteColor,
        child: Column(
          children: [
            // Fixed Drawer Header
            DrawerHeader(
              // decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.transparent))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 5.h,
                    backgroundColor: AppColor.primaryColor,
                    backgroundImage: const NetworkImage(
                      'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp='
                          '1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',
                    ),
                  ),
                  1.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sanketh S',
                        style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '+092312-9999980',
                        style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Bengaluru',
                        style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: drawerList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          switch (drawerList[index].title) {
                            case 'Pick up & Drop':
                              Get.to(() => const PickDropScreen());
                            case 'Logout':
                             Get.put(AuthController().logOut());
                            case 'Book My Trainer/Coach':
                              Get.to(()=> CoachIndexPage());
                              final sportId= coachController.homeController.allSportsModel.result!.data![0].id;
                              coachController.getCoachBySportId(sportId!);
                            case 'Start Tournament':
                              Get.to(()=> AddTournamentScreen());
                              break;
                          }
                        },
                        trailing: drawerList[index].icon != null
                            ? Icon(drawerList[index].icon)
                            : null,
                        titleTextStyle: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.blackColor),
                        contentPadding: const EdgeInsets.only(left: 10,right: 10),
                        title: Text(drawerList[index].title.toString()),
                      ),
                      Divider(
                        color: AppColor.primaryColor,
                        height: 0,
                        indent: 1.h,
                      ),
                    ],
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// case 'Become a Coach':
//   homeController.getAllSports();
//   Get.to(() =>  CoachRegistration1());


class KCoachDrawer extends StatelessWidget {
  final String? coachImg;
  String? coachName;
  String? coachPhone;
  String? coachLocation;
  KCoachDrawer({super.key,this.coachName,this.coachPhone,this.coachLocation,this.coachImg});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.whiteColor,
      child: Container(
        color: AppColor.whiteColor,
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 6.h,
                    backgroundColor: AppColor.primaryColor,
                    backgroundImage:  NetworkImage(coachImg!),
                  ),
                  1.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       coachName!,
                        style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      1.height,
                      Text(
                        coachPhone!,
                        style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      1.height,
                      Text(
                        coachLocation!,
                        style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: coachDrawerList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          switch (coachDrawerList[index].title) {
                            case 'Add Availability':
                              Get.to(() =>  AddAvailabilitySlot());
                              break;
                          }
                        },
                        trailing: coachDrawerList[index].icon != null
                            ? Icon(coachDrawerList[index].icon)
                            : null,
                        titleTextStyle: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColor.blackColor),
                        contentPadding: const EdgeInsets.only(left: 10,right: 10),
                        title: Text(coachDrawerList[index].title.toString()),
                      ),
                      Divider(
                        color: AppColor.primaryColor,
                        height: 0,
                        indent: 1.h,
                      ),
                    ],
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}