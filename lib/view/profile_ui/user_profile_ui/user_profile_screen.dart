import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/utils/extensions/text_capital_ext.dart';
import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoachController>(
      init: Get.put(CoachController()),
      builder: (coachController) => Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                // Green container
                Container(
                  color: AppColor.primaryColor,
                  height: mQ.width * 0.15 + 50,
                ),
                // White container
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        SizedBox(height: mQ.width * 0.15),
                        Text(
                          coachController.userByIdModel.result?.user?.name?.toCapitalize ?? 'No Name Available',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          coachController.userByIdModel.result?.user?.player?.sport?.name?.toCapitalize ?? 'No Sport Selected',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                        ),
                        1.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            addMatchContainer(
                              isSelected: selectedIndex.value == 0,
                              onTap: () {
                                selectedIndex.value = 0;
                              },
                              title: 'Matches Played',
                            ),
                            addMatchContainer(
                              isSelected: selectedIndex.value == 1,
                              onTap: () {
                                selectedIndex.value = 1;
                              },
                              title: 'Batting',
                            ),
                            addMatchContainer(
                              isSelected: selectedIndex.value == 2,
                              onTap: () {
                                selectedIndex.value = 2;
                              },
                              title: 'Bowling',
                            ),
                            addMatchContainer(
                              isSelected: selectedIndex.value == 3,
                              onTap: () {
                                selectedIndex.value = 3;
                              },
                              title: 'Awards',
                            ),
                          ],
                        ),
                        1.height,
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.primaryColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('10', style: primaryTextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                              Text('Matches Played', style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                        1.height,
                        if (coachController.userByIdModel.result?.user?.player?.matches != null &&
                            coachController.userByIdModel.result!.user!.player!.matches!.isNotEmpty)
                          ListView.builder(
                            itemCount: coachController.userByIdModel.result!.user!.player!.matches!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final match = coachController.userByIdModel.result?.user?.player?.matches?[index];
                              return UserProfileContainer(
                                matchResult: match?.result ?? 'No Result',
                                matchScore: '50 runs for 40 balls',
                                matchName: 'Match ${index + 1}',
                                matchLocation: match?.location ?? 'No Location',
                              );
                            },
                          )
                        else
                          Center(
                            child: Text(
                              'No matches Played',
                              style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Profile picture container
            Positioned(
              top: mQ.width * 0.15 * 0.5, // Adjust top to fit the avatar
              left: (mQ.width / 2) - mQ.width * 0.15, // Center the avatar
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: mQ.width * 0.15,
                  backgroundColor: AppColor.greyColor,
                  child: CircleAvatar(
                    radius: mQ.width * 0.15 * 0.9,
                    backgroundColor: AppColor.whiteColor,
                    backgroundImage: const NetworkImage(
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1721152706~exp=1721156306~hmac=2c807194b896fa519c27566ed79a328c3d4731ab06e5ee403ed9edaf32df7ac2&w=740',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
