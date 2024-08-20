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
import 'package:touch_down/widgets/custom_text_fields/k_textfields.dart';

class PickDropScreen extends StatefulWidget {
  const PickDropScreen({super.key});

  @override
  State<PickDropScreen> createState() => _PickDropScreenState();
}

class _PickDropScreenState extends State<PickDropScreen> {
  DateTime _selectedValue= DateTime.now();
  RxBool isAvailable = false.obs;
  RxBool isBooked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Pick up & Drop',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),),
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
                  color: Colors.black,
                ),
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
              1.height,
              Text('Search Pick up Location',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              1.height,
              GetTextField(
                context: context,
                hintText: 'select current location/enter location',
                keyboardType: TextInputType.name,
                obSecureText: false,
                suffixIcon: Icons.my_location_outlined,
              ),
              1.height,
              Text('Search Drop Location',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              1.height,
              GetTextField(
                context: context,
                hintText: 'enter drop location',
                keyboardType: TextInputType.name,
                obSecureText: false,
                suffixIcon: Icons.location_on,
              ),
              1.height,
              Text('Type of Pickup',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isAvailable.value,
                        onChanged: (bool? value) {
                          isAvailable.value = value!;
                        },
                        checkColor: Colors.white,
                        activeColor: AppColor.primaryColor,
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                            color: states.contains(MaterialState.selected) ? AppColor.primaryColor : AppColor.blackColor,
                            width: 1.5,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                      ),
                      Text(
                        "Individual Pickup",
                        style: primaryTextStyle(fontSize: 10,),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: isBooked.value,
                        onChanged: (bool? value) {
                          isBooked.value = value!;
                        },
                        checkColor: Colors.white,
                        activeColor: AppColor.primaryColor,
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                            color: states.contains(MaterialState.selected) ? AppColor.primaryColor : AppColor.blackColor,
                            width: 1.5,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                        ),
                      ),
                      Text(
                        "Team Pickup",
                        maxLines: 2,
                        style: primaryTextStyle(fontSize: 10.0,),
                      ),
                    ],
                  ),
                ],
              ),
              1.height,
              Align(
                alignment: Alignment.center,
                child: kTextButton(
                    onPressed: (){},
                    btnText: 'CONFIRM BOOKING',
                    color: AppColor.primaryColor,
                    textColor: AppColor.blackColor,
                    borderRadius: 22,
                    width: 55.w,
                    height: 5.h
                ),
              ),
              Text('News Updates',style: primaryTextStyle(fontSize: 12,fontWeight: FontWeight.w600),),
              ListView.builder(
                itemCount: 1,
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
      ),
    );
  }
}
