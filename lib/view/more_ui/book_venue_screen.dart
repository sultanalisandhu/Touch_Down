import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/more_ui/book_venue_inner.dart';
import 'package:touch_down/view/more_ui/confirm_booking.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_buttons.dart';

class BookVenueScreen extends StatefulWidget {
  const BookVenueScreen({super.key});

  @override
  State<BookVenueScreen> createState() => _BookVenueScreenState();
}

class _BookVenueScreenState extends State<BookVenueScreen> {
  DateTime _selectedValue= DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Book a Venue',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: AppColor.blackColor),),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor.primaryColor,
              selectedTextColor: Colors.white,
              width: 13.w,
              dateTextStyle: primaryTextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              dayTextStyle: primaryTextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              monthTextStyle: primaryTextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
            Text('Search Time Slots',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
            3.height,
            Align(
              alignment: Alignment.center,
              child: kTextButton(
                  onPressed: (){
                    Get.to(()=> ConfirmBookingScreen());
                  },
                  btnText: 'Book Now',
                  color: AppColor.primaryColor,
                  textColor: AppColor.blackColor,
                  borderRadius: 22,
                  width: 50.w,
                  height: 5.h
              ),
            ),
            Text('News Updates',style: primaryTextStyle(fontSize: 10,fontWeight: FontWeight.w600),),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return imgContainer(
                  imgPath: ImgUtils.cricketChampion,
                );
              },
            ),


          ],
        ).paddingSymmetric(horizontal: 15),
      ),
    );
  }
}
