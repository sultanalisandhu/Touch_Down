import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions.dart';
import 'package:touch_down/view/more_ui/book_venue_inner.dart';
import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
import 'package:touch_down/widgets/k_textfields.dart';

class SearchVenueScreen extends StatefulWidget {
  const SearchVenueScreen({super.key});

  @override
  State<SearchVenueScreen> createState() => _SearchVenueScreenState();
}

class _SearchVenueScreenState extends State<SearchVenueScreen> {
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
          title: Text('Search Venue',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const Divider(color: AppColor.primaryColor, height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bengaluru',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    addMatchContainer(
                        isSelected: selectedIndex.value==0,
                        onTap: (){
                          selectedIndex.value=0;
                        },
                        title: 'Select Sports'
                    ),
                    20.width,
                    addMatchContainer(
                        isSelected: selectedIndex.value==1,
                        onTap: (){
                          selectedIndex.value=1;
                        },
                        title: 'Based on Availability'
                    ),
                        ],),
                ],
              ),
              const Divider(color: AppColor.primaryColor,height: 40,),
              Text('Search Location',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
              10.height,
              GetTextField(context: context,
                hintText: 'select current location/enter location',
                obSecureText: false,
                suffixIcon: Icons.my_location,
              ),
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(()=> BookVenueInnerScreen());
                  },
                  child: Container(
                    height: mQ.height*0.23,
                    width: mQ.width,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: const Border(top: BorderSide(color: AppColor.primaryColor,width: 5),),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                            NetworkImage(
                                'https://img.freepik.com/free-photo/view-empty-football-stadium_23-2151569873.jpg?t=st=1721625578~exp='
                                    '1721629178~hmac=fab1a4c9dc45d56bb18093e979bd1dfc98a5efc1b4c9de56d85f886db5ab5c48&w=1800'))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Cricket Stadium',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.whiteColor),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(child: Row(
                              children: [
                                const Icon(Icons.location_on_sharp,color: AppColor.primaryColor,),
                                Text('1.5 KM',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColor.whiteColor),),
                              ],
                            )),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text('View More',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                                )
                              ],
                            )
                          ],)
                      ],),
                  ),
                );
              })


            ],
          ).paddingSymmetric(horizontal: 15),
        ),
      ),
    );
  }
}
