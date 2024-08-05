import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/edit_coach_profile1.dart';
import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
import 'package:touch_down/widgets/coach_profile_widget/k_book_coach_dialogue.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class CoachProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        scrolledUnderElevation: 0.0,
        title: Text('Book a Coach/Trainer',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              /// primary container
              Container(
                color: AppColor.primaryColor,
                height: mQ.width * 0.15 + 50,
              ),
              /// White container
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
                    padding: EdgeInsets.all(2.h),
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: kTextButton(
                            onPressed: (){
                              Get.to(()=> EditCoachProfile1());
                            },
                            btnText: 'Edit Profile',
                            height: 4.h,
                            width: 30.w,
                            borderRadius: 26
                          )),
                      SizedBox(height: mQ.width * 0.25 * 0.7),

                      2.height,
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // text column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About Coach',
                                      style: primaryTextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '"Martin is a highly experienced Cricket Coach with over 10 years of expertise in the field." '
                                          'He is dedicated to helping players improve their skills and achieve their full potential.',
                                      style: primaryTextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.width,
                              // detail container
                              Expanded(
                                child: Column(
                                  children: [
                                    coachDetailContainer(
                                      title: 'Jay Nagar ,Bangaluru',
                                      iconPath: Icons.location_on,
                                    ),
                                    coachDetailContainer(
                                      title: '10:00 Am to 6:00 Pm',
                                      iconPath: Icons.access_time,
                                    ),
                                    coachDetailContainer(
                                      title: '25 USD/232 USD',
                                      iconPath: Icons.attach_money,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          1.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Reviews',
                                style: primaryTextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              kTextButton(
                                onPressed: () {
                                  BookCoach(context);
                                },
                                borderRadius: 25,
                                height: 5.h,
                                width: 45.w,
                                btnText: 'BOOK A COACH',
                                textColor: AppColor.blackColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      2.height,
                      ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return const ReviewCard(
                            name: 'Jane Doe',
                            date: '29/08/2023',
                            review:
                            'He has successfully trained numerous players who have excelled at both national and international levels',
                            rating: 5,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          /// Profile picture container
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
                    backgroundImage: const NetworkImage(
                      'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp='
                          '1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',
                    ),
                  ),
                ),
                Text(
                  'Martin Desouza',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Cricket Coach',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void BookCoach(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BookCoachDialog(),
    );
  }
}














// class CoachProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       backgroundColor: AppColor.primaryColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: AppColor.primaryColor,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               /// Red container
//               Container(
//                 color:AppColor.primaryColor,
//                 height: mQ.width * 0.15 + 50,
//               ),
//               /// White container
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color:AppColor.whiteColor,
//                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
//                   ),
//                   child: ListView(
//                     padding: EdgeInsets.all(16),
//                     children: [
//                       SizedBox(height: mQ.width * 0.15), // Space for the overlapping profile picture
//                       Text(
//                         'Martin Desouza',
//                         textAlign: TextAlign.center,
//                         style: primaryTextStyle(fontSize: 24, fontWeight: FontWeight.w700,),
//                       ),
//                       Text(
//                         'Cricket Coach',
//                         textAlign: TextAlign.center,
//                         style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w400),
//                       ),
//                      16.height,
//                       Column(
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // text column
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                   Text(
//                                     'About Coach',
//                                     style: primaryTextStyle(fontSize: 18, fontWeight: FontWeight.w700,),
//                                   ),
//                                   Text(
//                                     '"Martin is a highly experienced Cricket Coach with over 10 years of expertise in the field."'
//                                       ' is dedicated to helping players improve their skills and achieve their full potential.'
//                                         ' is dedicated to helping players improve their skills and achieve their full potential.',
//                                     style: primaryTextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
//                                   ),
//                                 ],),
//                               ),
//                               10.width,
//                               //detail container
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                   coachDetailContainer(
//                                     title: 'Jay Nagar ,Bangaluru',
//                                     iconPath: Icons.location_on,
//                                   ),
//                                     coachDetailContainer(
//                                       title: '10:00 Am to 6:00 Pm',
//                                       iconPath: Icons.access_time,
//                                     ),
//                                     coachDetailContainer(
//                                       title: '25 USD/232 USD',
//                                       iconPath: Icons.attach_money,
//                                     ),
//                                 ],),
//                               ),
//                             ],
//                           ),
//                           10.height,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Reviews',
//                                 style: primaryTextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               kTextButton(
//                                 onPressed: () {
//                                   BookCoach(context);
//                                 },
//                                 borderRadius: 25,
//                                 height: 45,
//                                 width: 180,
//                                 btnText: 'BOOK A COACH',
//                                 textColor: AppColor.blackColor
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                      15.height,
//                       ListView.builder(
//                           itemCount: 6,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemBuilder: (context,index){
//                         return ReviewCard(
//                             name: 'Jane Doe',
//                             date: '29/08/2023',
//                             review: 'He has successfully trained numerous players who have excelled at both national and international levels',
//                             rating: 5);
//                       })
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           /// Profile picture container
//           Positioned(
//             top: mQ.width * 0.15 * 0.5, // Adjust top to fit the avatar
//             left: (mQ.width / 2) - mQ.width * 0.15, // Center the avatar
//             child: CircleAvatar(
//               radius: mQ.width * 0.15,
//               backgroundColor: AppColor.greyColor,
//               child: CircleAvatar(
//                 radius: mQ.width * 0.15 * 0.9,
//                 backgroundColor: AppColor.whiteColor,
//                 backgroundImage: const NetworkImage(
//                     'https://img.freepik.com/free-psd/portrait-bearded-man-white-sweatshirt-3d-rendering_1142-53186.jpg?t=st=1720678505~exp='
//                         '1720682105~hmac=033bb8536ff19635e6b47aba507d9b1d51d115e5ffbc0cb7cb3565a45be6a384&w=900',),
//
//
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   void BookCoach(BuildContext context){
//     showDialog(
//         context: context,
//         builder: (context)=>BookCoachDialog());
//   }
// }


