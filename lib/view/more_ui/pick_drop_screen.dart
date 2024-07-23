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
import 'package:touch_down/widgets/k_textfields.dart';

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
          title: Text('Pick up & Drop',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
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
              15.height,
              Text('Search Pick up Location',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              5.height,
              GetTextField(
                context: context,
                hintText: 'select current location/enter location',
                keyboardType: TextInputType.name,
                obSecureText: false,
                suffixIcon: Icons.my_location_outlined,
              ),
              15.height,
              Text('Search Drop Location',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              5.height,
              GetTextField(
                context: context,
                hintText: 'enter drop location',
                keyboardType: TextInputType.name,
                obSecureText: false,
                suffixIcon: Icons.location_on,
              ),
              15.height,
              Text('Type of Pickup',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
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
                        style: primaryTextStyle(fontSize: 16.0,),
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
                        style: primaryTextStyle(fontSize: 16.0,),
                      ),
                    ],
                  ),
                ],
              ),
              10.height,
              Align(
                alignment: Alignment.center,
                child: kTextButton(
                    onPressed: (){},
                    btnText: 'CONFIRM BOOKING',
                    color: AppColor.primaryColor,
                    textColor: AppColor.blackColor,
                    borderRadius: 22,
                    width: 180,
                    height: 40
                ),
              ),
              Text('News Updates',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              ListView.builder(
                itemCount: 1,
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
      ),
    );
  }
}
