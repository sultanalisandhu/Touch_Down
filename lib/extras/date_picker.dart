// Available dates list
// SizedBox(
//   height: 70,
//   width: mQ.width,
//   child: ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: availableDates.length,
//     itemBuilder: (context, index) {
//       DateTime date = DateTime.parse(availableDates[index]);
//       String day = DateFormat('EEE').format(date);
//       String dateNum = DateFormat('d').format(date);
//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         margin: const EdgeInsets.symmetric(horizontal: 2),
//         decoration: BoxDecoration(
//           color: AppColor.primaryColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the date number
//             Text(dateNum, style: primaryTextStyle(fontSize: 10)),
//             // Display the first three letters of the day
//             Text(day, style: primaryTextStyle(fontSize: 10)),
//           ],
//         ),
//       );
//     },
//   ),
// ),