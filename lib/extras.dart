///date picker week name above custom
// import 'package:flutter/material.dart';
// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   DateTime _selectedValue = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Date Picker Timeline Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Display month and year
//             Text(
//               DateFormat('MMMM yyyy').format(_selectedValue),
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             // Custom Date Picker Timeline
//             CustomDatePickerTimeline(
//               selectedDate: _selectedValue,
//               onDateChange: (date) {
//                 setState(() {
//                   _selectedValue = date;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomDatePickerTimeline extends StatelessWidget {
//   final DateTime selectedDate;
//   final Function(DateTime) onDateChange;
//
//   CustomDatePickerTimeline({
//     required this.selectedDate,
//     required this.onDateChange,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final List<DateTime> dates = List.generate(
//       7, // Display 7 days (can adjust as needed)
//           (index) => DateTime.now().add(Duration(days: index - 3)),
//     );
//
//     return SizedBox(
//       height: 120, // Adjust height to fit your design
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: dates.length,
//         itemBuilder: (context, index) {
//           final date = dates[index];
//           final isSelected = date.day == selectedDate.day &&
//               date.month == selectedDate.month &&
//               date.year == selectedDate.year;
//
//           return GestureDetector(
//             onTap: () => onDateChange(date),
//             child: Container(
//               width: 80, // Adjust width to fit your design
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: isSelected ? Colors.blue : Colors.transparent,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     DateFormat('E').format(date), // Week name
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: isSelected ? Colors.blue : Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     date.day.toString(), // Day number
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: isSelected ? Colors.blue : Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     DateFormat('E').format(date), // Week name (below)
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: isSelected ? Colors.blue : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



///serach venue class month name above
// import 'package:date_picker_timeline/date_picker_timeline.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:touch_down/utils/constants.dart';
// import 'package:touch_down/utils/extensions.dart';
// import 'package:touch_down/view/more_ui/book_venue_inner.dart';
// import 'package:touch_down/widgets/home_widgets/home_widgets.dart';
// import 'package:touch_down/widgets/k_textfields.dart';
// import 'package:intl/intl.dart';
//
// class SearchVenueScreen extends StatefulWidget {
//   const SearchVenueScreen({super.key});
//
//   @override
//   State<SearchVenueScreen> createState() => _SearchVenueScreenState();
// }
//
// class _SearchVenueScreenState extends State<SearchVenueScreen> {
//   DateTime _selectedValue= DateTime.now();
//   RxInt selectedIndex = 0.obs;
//   RxBool isAvailable = false.obs;
//   RxBool isBooked = false.obs;
//   @override
//   Widget build(BuildContext context) {
//     return Obx(()=>Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: Text('Search Venue',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               DateFormat('MMMM yyyy').format(_selectedValue),
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             DatePicker(
//               DateTime.now(),
//               initialSelectedDate: DateTime.now(),
//               selectionColor: AppColor.primaryColor,
//               selectedTextColor: Colors.white,
//
//               dateTextStyle: primaryTextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               dayTextStyle: primaryTextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black,
//               ),
//               monthTextStyle: primaryTextStyle(
//                 fontSize: 0, // Setting the font size to 0 to hide the month
//                 color: Colors.transparent,
//               ),
//               onDateChange: (date) {
//                 // New date selected
//                 setState(() {
//                   _selectedValue = date;
//                 });
//               },
//             ),
//             const Divider(color: AppColor.primaryColor, height: 40,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Bengaluru',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     addMatchContainer(
//                         isSelected: selectedIndex.value==0,
//                         onTap: (){
//                           selectedIndex.value=0;
//                         },
//                         title: 'Select Sports'
//                     ),
//                     20.width,
//                     addMatchContainer(
//                         isSelected: selectedIndex.value==1,
//                         onTap: (){
//                           selectedIndex.value=1;
//                         },
//                         title: 'Based on Availability'
//                     ),
//                   ],),
//               ],
//             ),
//             const Divider(color: AppColor.primaryColor,height: 40,),
//             Text('Search Location',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
//             10.height,
//             GetTextField(context: context,
//               hintText: 'select current location/enter location',
//               obSecureText: false,
//               suffixIcon: Icons.my_location,
//             ),
//             ListView.builder(
//                 itemCount: 3,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemBuilder: (context,index){
//                   return GestureDetector(
//                     onTap: (){
//                       Get.to(()=> BookVenueInnerScreen());
//                     },
//                     child: Container(
//                       height: mQ.height*0.23,
//                       width: mQ.width,
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           border: const Border(top: BorderSide(color: AppColor.primaryColor,width: 5),),
//                           image: const DecorationImage(
//                               fit: BoxFit.cover,
//                               image:
//                               NetworkImage(
//                                   'https://img.freepik.com/free-photo/view-empty-football-stadium_23-2151569873.jpg?t=st=1721625578~exp='
//                                       '1721629178~hmac=fab1a4c9dc45d56bb18093e979bd1dfc98a5efc1b4c9de56d85f886db5ab5c48&w=1800'))
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text('Cricket Stadium',style: primaryTextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColor.whiteColor),),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(child: Row(
//                                 children: [
//                                   const Icon(Icons.location_on_sharp,color: AppColor.primaryColor,),
//                                   Text('1.5 KM',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColor.whiteColor),),
//                                 ],
//                               )),
//                               Row(
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       color: AppColor.primaryColor,
//                                       borderRadius: BorderRadius.circular(22),
//                                     ),
//                                     child: Text('View More',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
//                                   )
//                                 ],
//                               )
//                             ],)
//                         ],),
//                     ),
//                   );
//                 })
//
//
//           ],
//         ).paddingSymmetric(horizontal: 15),
//       ),
//     ),
//     );
//   }
// }


///home screen expanded
// Expanded(
// child: SingleChildScrollView(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('Select Sports', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
// 20.height,
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Centauraus(
// onTap: (){
// Get.to(()=> CricketHomeScreen());
// },
// iconPath: ImgUtils.greenCricketImg, sportName: 'Cricket'),
// Centauraus(onTap: (){}, iconPath: ImgUtils.basketBallImg, sportName: 'Football'),
// Centauraus(onTap: (){}, iconPath: ImgUtils.greenBadmintonImg, sportName: 'Badminton'),
// Centauraus(onTap: (){}, iconPath: ImgUtils.volleyBalImg, sportName: 'Table Tennis'),
// ],
// ),
// 20.height,
// Text('Recent News Updates', style: primaryTextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
// ListView.builder(
// itemCount: 10,
// shrinkWrap: true,
// padding: EdgeInsets.zero,
// physics: const NeverScrollableScrollPhysics(),
// itemBuilder: (context, index) {
// return newsContainer(
// updateName: 'News Update ${index + 1}',
// newsDetails: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
// );
// },
// ),
// ],
// ),
// ),
// ),
// ),