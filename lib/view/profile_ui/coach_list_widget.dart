import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class CoachProfileCard extends StatelessWidget {
  final String? coachName;
  final String? coachLocation;
  final String? coachImg;
  final String? coachSportImg;
  final int? rating;
  const CoachProfileCard({super.key,this.rating, this.coachName, this.coachLocation, this.coachImg, this.coachSportImg});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.primaryColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 5.h,
                    backgroundColor: Colors.green.shade100,
                    backgroundImage: NetworkImage(coachImg!),
                  ),
                  2.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coachName!,
                        style: primaryTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      2.height,
                      Row(
                        children: [
                          const Icon(Icons.location_pin, size: 14),
                          Text(
                            coachLocation!,
                            style: primaryTextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),
                        ],
                      ),

                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < rating! ? Icons.star : Icons.star_border,
                            color: index < rating! ?Colors.yellow:AppColor.greyColor,
                            size: 2.2.h,
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.green,height: 5.h,),
              Row(
                children: [
                  Text('Sports:', style: primaryTextStyle(fontWeight: FontWeight.w400,fontSize: 10)),
                 2.width,
                 const Image(image: AssetImage(ImgUtils.greenCricketImg),height: 20,width: 20,),
                  const Spacer(),
                  kTextButton(
                    onPressed: () {},
                    btnText: 'View More',
                    width: 30.w,
                    height: 4.h,
                  ),
                ],
              ),

            ],
          ),
        ),
        Positioned(
          top: 2,
          left: 0,
          child: showSvgIconWidget(iconPath: IconUtils.badgeIcon),
        ),
      ],
    );
  }
}
