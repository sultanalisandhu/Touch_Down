import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/coach_profile_widget/coach_widgets.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RxInt selectedIndex = 0.obs;

    return Obx(()=> Scaffold(
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
                /// green container
                Container(
                  color:AppColor.primaryColor,
                  height: mQ.width * 0.15 + 50,
                ),
                /// White container
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color:AppColor.whiteColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                    ),
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        SizedBox(height: mQ.width * 0.15),
                        Text(
                          'User Name',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w700,),
                        ),
                        Text(
                          'Cricket Coach',
                          textAlign: TextAlign.center,
                          style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w400),
                        ),
                        1.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            addMatchContainer(
                                isSelected: selectedIndex.value==0,
                                onTap: (){
                                  selectedIndex.value=0;
                                },
                                title: 'Matches Played'
                            ),
                            addMatchContainer(
                                isSelected: selectedIndex.value==1,
                                onTap: (){
                                  selectedIndex.value=1;
                                },
                                title: 'Batting'
                            ),
                            addMatchContainer(
                                isSelected: selectedIndex.value==2,
                                onTap: (){
                                  selectedIndex.value=2;
                                },
                                title: 'Bowling'
                            ),
                            addMatchContainer(
                                isSelected: selectedIndex.value==3,
                                onTap: (){
                                  selectedIndex.value=3;
                                },
                                title: 'Awards'
                            ),
                          ],
                        ),
                        1.height,
                        Container(
                          height: mQ.height*0.15,
                          width: mQ.width*0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.primaryColor)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('10',style: primaryTextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                              Text('Matches Played',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                        1.height,
                        ListView.builder(
                            itemCount: 6,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context,index){
                              return UserProfileContainer(
                                  matchResult: 'Won the match ',
                                  matchScore: '50 runs for  40 balls',
                                  matchName: 'Match A',
                                matchLocation: '( Cricket grounds, JP Nagar, Bengaluru)',
                                  );
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /// Profile picture container
            Positioned(
              top: mQ.width * 0.15 * 0.5, // Adjust top to fit the avatar
              left: (mQ.width / 2) - mQ.width * 0.15, // Center the avatar
              child: CircleAvatar(
                radius: mQ.width * 0.15,
                backgroundColor: AppColor.greyColor,
                child: CircleAvatar(
                  radius: mQ.width * 0.15 * 0.9,
                  backgroundColor: AppColor.whiteColor,
                  backgroundImage: const NetworkImage(
                    'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1721152706~exp=1721156306~hmac=2c807194b896fa519c27566ed79a328c3d4731ab06e5ee403ed9edaf32df7ac2&w=740'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


