import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/more_ui/book_venue_inner.dart';
import 'package:touch_down/view/more_ui/pick_drop_screen.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_buttons.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class ConfirmBookingScreen extends StatefulWidget {
  const ConfirmBookingScreen({super.key});

  @override
  State<ConfirmBookingScreen> createState() => _ConfirmBookingScreenState();
}

class _ConfirmBookingScreenState extends State<ConfirmBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        elevation: 0,
        centerTitle: true,
        title: Text('Book a Venue',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Name',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
            1.height,
            GetTextField(
              context: context,
              hintText: 'Your Name',
              keyboardType: TextInputType.name,
              obSecureText: false,
            ),
            1.height,
            Text('Email ID',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
            1.height,
            GetTextField(
              context: context,
              hintText: 'Your Email',
              keyboardType: TextInputType.emailAddress,
              obSecureText: false,
            ),
            1.height,
            Text('Phone Number',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
            1.height,
            GetTextField(
              context: context,
              hintText: 'Enter Your Phone Number',
              keyboardType: TextInputType.number,
              obSecureText: false,
            ),
            2.height,
            Align(
              alignment: Alignment.center,
              child: kTextButton(
                  onPressed: (){
                   successDialog(context);
                  },
                  btnText: 'Confirm Booking',
                  color: AppColor.primaryColor,
                  textColor: AppColor.blackColor,
                  borderRadius: 22,
                  width: 60.w,
                  height: 5.h
              ),
            ),
            Text('News Updates',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return imgContainer(
                  imgPath: ImgUtils.cricketUpdateImg,
                );
              },
            ),
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
    );
  }
void successDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => 
        AlertDialog(
      icon: const CircleAvatar(
        radius: 50,
        backgroundColor: AppColor.primaryColor,
        child: Icon(Icons.check, color: Colors.white,size: 40,),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Booking',
            style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
          Text(
            'Successful !',
            textAlign: TextAlign.center,
            style: primaryTextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
          1.height,
          Text(
            'We will confirm your booking in sometime',
            textAlign: TextAlign.center,
            style: primaryTextStyle(fontWeight: FontWeight.w400, fontSize: 10),
          ),
          2.height,
          kTextButton(
              onPressed: () {
                Get.to(()=> PickDropScreen());
              },
              color: AppColor.primaryColor,
            width: 55.w,
            borderRadius: 20,
            height: 5.h,

              btnText: 'Okay !',
              textColor: AppColor.blackColor,
          ),
        ],
      ),
    ),
  );
}
}
