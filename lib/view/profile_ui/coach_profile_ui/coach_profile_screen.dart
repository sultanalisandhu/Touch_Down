import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/model/user_detail_model.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/utils/extensions/text_capital_ext.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile1.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
import 'package:touch_down/widgets/coach_profile_widget/book_coach_dialogue/k_book_coach_dialogue.dart';
import 'package:touch_down/widgets/home_widgets/k_drawer/k_drawer.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class CoachProfileScreen extends StatelessWidget {
  final String? userId;
   CoachProfileScreen({super.key, this.userId});
   final CoachController coachController = Get.find<CoachController>(tag: 'coachController');

   @override
   @override
   Widget build(BuildContext context) {
     printWarning('UserId IN THE Coach profile page ${userId}');
     coachController.getUserById(userId);
     return Obx(() {
       final userDetail = coachController.userDetailModel.result?.user;
       final coach = userDetail?.coach;

       if (userDetail == null || coach == null) {
         return Scaffold(
           backgroundColor: AppColor.primaryColor,
           body: kCircularLoading(),
         );
       } else {
         String formatTime(String time) {
           DateTime dateTime = DateFormat("HH:mm").parse(time);
           return DateFormat("h:mm a").format(dateTime);
         }

         String startTime = coach.availabilities?.isNotEmpty == true
             ? formatTime(coach.availabilities![0].startTime.toString())
             : 'No available time';
         String endTime = coach.availabilities?.isNotEmpty == true
             ? formatTime(coach.availabilities![0].endTime.toString())
             : '';

         return Scaffold(
           backgroundColor: AppColor.primaryColor,
           appBar: AppBar(
             title: Text(
               'Book a Coach/Trainer',
               style: primaryTextStyle(fontSize: 14),
             ),
             centerTitle: true,
             backgroundColor: Colors.transparent,
           ),
           drawer: KCoachDrawer(
             coachImg: userDetail.avatar != null
                 ? '${ApiRoutes.baseUrl}${userDetail.avatar}'
                 : 'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg',
             coachName: userDetail.name ?? 'N/A',
             coachPhone: userDetail.phone ?? 'N/A',
             coachLocation: coach.location ?? 'N/A',
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
                             child: LocalStorage.read(LocalStorage.playerId).isEmpty
                                 ? kTextButton(
                               onPressed: () {
                                 Get.to(() => EditCoachProfile1());
                               },
                               btnText: 'Edit Profile',
                               height: 4.h,
                               width: 30.w,
                               borderRadius: 26,
                             )
                                 : const SizedBox.shrink(),
                           ),
                           LocalStorage.read(LocalStorage.playerId).isEmpty
                               ? SizedBox(height: mQ.width * 0.25 * 0.7): SizedBox(height: mQ.width * 0.35 * 0.7),
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
                                       title: '${coach.address!.toCapitalize ?? ''}, ${coach.location!.toCapitalize ?? ''}',
                                       iconPath: Icons.location_on,
                                     ),
                                     coachDetailContainer(
                                       title: startTime == 'No available time'
                                           ? startTime
                                           : "$startTime to $endTime",
                                       iconPath: Icons.access_time,
                                     ),
                                     coachDetailContainer(
                                       title: coach.fee ?? 'N/A',
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
                               LocalStorage.read(LocalStorage.playerId).isNotEmpty
                                   ? kTextButton(
                                 onPressed: () {
                                   bookCoach(context);
                                 },
                                 height: 4.h,
                                 width: 40.w,
                                 btnText: 'BOOK A COACH',
                               )
                                   : const SizedBox.shrink(),
                             ],
                           ),
                           2.height,
                           coach.reviews == null || coach.reviews!.isEmpty
                               ? Text(
                             'Received No Reviews Right Now',
                             style: primaryTextStyle(fontSize: 14),
                           )
                               : Expanded(
                             child: ListView.builder(
                               itemCount: coach.reviews!.length,
                               itemBuilder: (context, index) {
                                 DateTime reviewDate = DateTime.parse(coach.reviews![index].createdAt.toString());
                                 String formattedDate = DateFormat('dd MMM yyyy').format(reviewDate);
                                 return ReviewCard(
                                   name: coach.reviews![index].user!.name ?? 'Anonymous',
                                   date: formattedDate,
                                   review: coach.reviews![index].comment ?? '',
                                   rating: coach.reviews![index].rating?.toInt() ?? 0,
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
                 top: mQ.width * 0.18 * 0.6,
                 left: (mQ.width / 4) - mQ.width * 0.17,
                 child: Column(
                   children: [
                     CircleAvatar(
                       radius: mQ.width * 0.17,
                       backgroundColor: AppColor.greyColor,
                       child: CircleAvatar(
                         radius: mQ.width * 0.16,
                         backgroundColor: AppColor.whiteColor,
                         backgroundImage: NetworkImage(
                           userDetail.avatar != null
                               ? '${ApiRoutes.baseUrl}${userDetail.avatar}'
                               : 'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg',
                         ),
                       ),
                     ),
                     Text(
                       userDetail.name!.toTitleCase ?? 'N/A',
                       textAlign: TextAlign.center,
                       style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                     ),
                     Text(
                       coach.sport?.name!.toTitleCase ?? 'Unknown Sport',
                       textAlign: TextAlign.center,
                       style: primaryTextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
            coachSport: coach!.sport!.name,
            coachId: coach.id,
          ),
    );
  }
}
