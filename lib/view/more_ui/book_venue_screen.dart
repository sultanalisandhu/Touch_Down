import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: Text('Book a Venue',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: AppColor.primaryColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                });
              },
            ),
            Text('Search Time Slots',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            30.height,
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
                  width: 120,
                  height: 40
              ),
            ),
            Text('News Updates',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 15),
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
