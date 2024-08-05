import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_svg_icon.dart';

class CoachProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(vertical: 10),
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
                    child: Icon(Icons.person, size: 24, color: Colors.green),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Chirag Kumar',
                            style: primaryTextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.location_pin, size: 14),
                      Text(
                          'BTM Layout, Bangalore',
                        style: primaryTextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500
                        ),),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow.shade900, size: 2.h),
                          Icon(Icons.star, color: Colors.yellow.shade900, size: 2.h),
                          Icon(Icons.star, color: Colors.yellow.shade900, size: 2.h),
                          Icon(Icons.star, color: Colors.yellow.shade900, size: 2.h),
                          Icon(Icons.star_border, color: Colors.yellow.shade900, size: 2.h),
                        ],
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
