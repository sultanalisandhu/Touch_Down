import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/model/user_detail_model.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile1.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
import 'package:touch_down/widgets/coach_profile_widget/k_book_coach_dialogue.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/k_drawer.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class CoachProfileScreen extends StatelessWidget {

   CoachProfileScreen({super.key});
   final CoachController coachController = Get.put(CoachController());

   @override
  Widget build(BuildContext context) {
    coachController.getUserDetails();
    return Obx(() {
      if (coachController.userDetailModel.result == null) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: kCircularLoading(),
        );
      } else {
        UserDetailModel userDetail = coachController.userDetailModel;
        User? user = userDetail.result!.user;
        Coach? coach = user!.coach;
        String formatTime(String time) {
          DateTime dateTime = DateFormat("HH:mm").parse(time);
          return DateFormat("h:mm a").format(dateTime);
        }
        // Safely check if availabilities is not null or empty
        String startTime = coach!.availabilities!.isNotEmpty
            ? formatTime(coach.availabilities![0].startTime.toString())
            : 'No available time';
        String endTime =  coach.availabilities!.isNotEmpty
            ? formatTime(coach.availabilities![0].endTime.toString())
            : '';

        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          appBar: AppBar(
            title: Text('Book a Coach/Trainer'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          drawer:  KCoachDrawer(
            coachImg: '${ApiRoutes.baseUrl}${user.avatar}',
            coachName: user.name,
            coachPhone: user.phone,
            coachLocation: coach.location,
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: AppColor.primaryColor,
                    height: mQ.width * 0.15 + 50,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1.h),
                      decoration: const BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: kTextButton(
                              onPressed: () {
                                Get.to(() => EditCoachProfile1());
                              },
                              btnText: 'Edit Profile',
                              height: 4.h,
                              width: 30.w,
                              borderRadius: 26,
                            ),
                          ),
                          SizedBox(height: mQ.width * 0.25 * 0.7),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About Coach',
                                      style: primaryTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      coach.description ?? 'N/A',
                                      style: primaryTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              1.width,
                              Expanded(
                                child: Column(
                                  children: [
                                    coachDetailContainer(
                                      title: '${coach.address}, ${coach.location}',
                                      iconPath: Icons.location_on,
                                    ),
                                    coachDetailContainer(
                                      title:
                                      startTime == 'No available time'
                                          ? startTime
                                          : "$startTime to $endTime",
                                      iconPath: Icons.access_time,
                                    ),
                                    coachDetailContainer(
                                      title: coach.fee,
                                      iconPath1: IconUtils.iRupeeIcon,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Reviews',
                                style: primaryTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kTextButton(
                                onPressed: () {bookCoach(context);},
                                height: 4.h,
                                width: 40.w,
                                btnText: 'BOOK A COACH',
                              ),
                            ],
                          ),
                          2.height,
                          coachController.userDetailModel.result!.user!.coach!.reviews ==null || coachController.userDetailModel.result!.user!.coach!.reviews!.isEmpty
                              ? Text('Received No Reviews Right Now',style: primaryTextStyle(fontSize: 14),)
                              : Expanded(
                            child: ListView.builder(
                              itemCount: coachController.userDetailModel.result!.user!.coach!.reviews!.length,
                              itemBuilder: (context, index) {
                                DateTime reviewDate= DateTime.parse(coachController.userDetailModel.result!.user!.coach!.reviews![index].createdAt.toString());
                                String formattedDate = DateFormat('dd MMM yyyy').format(reviewDate);
                                return  ReviewCard(
                                  name: coachController.userDetailModel.result!.user!.coach!.reviews![index].user!.name.toString(),
                                  date: formattedDate,
                                  review: coachController.userDetailModel.result!.user!.coach!.reviews![index].comment.toString(),
                                  rating: coachController.userDetailModel.result!.user!.coach!.reviews![index].rating!.toInt(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: mQ.width * 0.18 * 0.9,
                left: (mQ.width / 4) - mQ.width * 0.13,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: mQ.width * 0.13,
                      backgroundColor: AppColor.greyColor,
                      child: CircleAvatar(
                        radius: mQ.width * 0.13 * 0.9,
                        backgroundColor: AppColor.whiteColor,
                        backgroundImage: NetworkImage(
                          user.avatar != null
                              ? '${ApiRoutes.baseUrl}${user.avatar}'
                              : 'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp=1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',
                        ),
                      ),
                    ),
                    Text(
                      user.name ?? '',
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w700,),
                    ),
                    //coach sport
                    Text(
                      user.coach!.sport!.name.toString(),
                      textAlign: TextAlign.center,
                      style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  void bookCoach(BuildContext context) {
    final userDetail = coachController.userDetailModel.result!.user;
    final coach = userDetail!.coach;

    showDialog(
      context: context,
      builder: (context) =>
          BookCoachDialog(
            imgUrl: userDetail.avatar != null
                ? '${ApiRoutes.baseUrl}${userDetail.avatar}'
                : 'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp=1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',
            coachName: userDetail.name ?? '',
            coachSport: 'Volley Ball Coach',
          ),
    );
  }
}
