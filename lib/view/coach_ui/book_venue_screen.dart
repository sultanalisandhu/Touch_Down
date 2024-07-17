import 'dart:ffi';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';

class BookVenueScreen extends StatefulWidget {
  const BookVenueScreen({super.key});

  @override
  State<BookVenueScreen> createState() => _BookVenueScreenState();
}

class _BookVenueScreenState extends State<BookVenueScreen> {
  DateTime _selectedValue= DateTime.now();
  RxInt selectedIndex = 0.obs;
  RxBool isAvailable = false.obs;
  RxBool isBooked = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Book a Venue',style: primaryTextStyle(color: AppColor.primaryColor,fontSize: 18,fontWeight: FontWeight.w600),),),
        body: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              Divider(
                color: AppColor.primaryColor,
              height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bangluru',style: primaryTextStyle(color: AppColor.primaryColor,
                      fontSize: 16,fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                    addMatchContainer(
                        isSelected: selectedIndex.value==0,
                        onTap: (){
                          selectedIndex.value=0;
                        },
                        title: 'Morning'
                    ),
                    addMatchContainer(
                        isSelected: selectedIndex.value==1,
                        onTap: (){
                          selectedIndex.value=1;
                        },
                        title: 'Afternoon'
                    ),
                    addMatchContainer(
                        isSelected: selectedIndex.value==2,
                        onTap: (){
                          selectedIndex.value=2;
                        },
                        title: 'Evening'
                    ),
                        ],),
                ],
              ),
              Divider(color: AppColor.primaryColor,height: 40,),
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
                          activeColor: Colors.red,
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                              color: states.contains(MaterialState.selected) ? Colors.red : AppColor.blackColor,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                        ),
                        Text(
                          "Available",
                          maxLines: 2,
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
                          activeColor: Colors.red,
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                              color: states.contains(MaterialState.selected) ? Colors.red : AppColor.blackColor,
                              width: 1.5,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                        ),
                        Text(
                          "Booked",
                          maxLines: 2,
                          style: primaryTextStyle(fontSize: 16.0,),
                        ),
                      ],
                    ),
                  ],
                ),
              Container(
                height: 150,
                width: mQ.width,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.greyColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border(
                    top: BorderSide(
                      color: AppColor.primaryColor, // Your desired border color
                      width: 5.0, // Your desired border width
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Cricket Academy A',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.primaryColor),),
                  Row(children: [
                    Icon(Icons.location_on_sharp,color: AppColor.primaryColor,),
                    Text('1.5 KM',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400,),),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColor.greyColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('09 AM',style: primaryTextStyle(color: AppColor.primaryColor),),
                        )
                      ],
                    )
                  ],)
                ],),
              )

            ],
          ).paddingSymmetric(horizontal: 15)
        ],),
      ),
    );
  }
}
