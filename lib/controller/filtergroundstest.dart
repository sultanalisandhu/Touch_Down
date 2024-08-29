// class AddTournamentScreen extends StatelessWidget {
//   AddTournamentScreen({super.key});
//   final HomeController homeController = Get.find<HomeController>(tag: 'homeController');
//   final TournamentController tournamentController = Get.put(TournamentController(), tag: 'tournamentController');
//   final TextEditingController sportController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             10.height,
//             Text(
//               'Select Sports',
//               style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             GetTextField(
//               context: context,
//               obSecureText: false,
//               hintText: 'Select Sport',
//               controller: sportController,
//               onChanged: (value) {
//                 homeController.filterSports(value);
//               },
//             ),
//             // Filtered sport container
//             Obx(() {
//               return SizedBox(
//                 height: 100,
//                 child: ListView.builder(
//                   itemCount: homeController.filteredSports.length,
//                   itemBuilder: (context, index) {
//                     final sport = homeController.filteredSports[index];
//                     return ListTile(
//                       contentPadding: EdgeInsets.zero,
//                       title: Text(sport.name!.toCapitalize, style: primaryTextStyle(fontSize: 12)),
//                       onTap: () {
//                         sportController.text = sport.name ?? '';
//                         homeController.setSelectedSport = sport;
//                         tournamentController.selectedSportId.value = sport.id!;
//                       },
//                     );
//                   },
//                 ),
//               );
//             }),
//             2.height,
//             Text(
//               'Tournament Name',
//               style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             GetTextField(
//               context: context,
//               controller: tournamentController.tournamentNameController,
//               obSecureText: false,
//               hintText: 'Enter Name',
//             ),
//             2.height,
//             Text(
//               'Location',
//               style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             GestureDetector(
//               onTap: () {
//                 tournamentController.fetchGroundReservation(); // Fetch grounds when tapped
//                 tournamentController.isGroundVisible.value = true; // Show ground container
//               },
//               child: GetTextField(
//                 context: context,
//                 hintText: 'Select Location',
//                 controller: locationController,
//                 obSecureText: false,
//                 onChanged: (value) {
//                   tournamentController.filterGrounds(value); // Filter grounds based on input
//                 },
//               ),
//             ),
//             Obx(() {
//               if (!tournamentController.isGroundVisible.value) {
//                 return Container(); // Hide container if not visible
//               }
//               return SizedBox(
//                 height: 100,
//                 child: ListView.builder(
//                   itemCount: tournamentController.filteredGrounds.length,
//                   itemBuilder: (context, index) {
//                     final ground = tournamentController.filteredGrounds[index];
//                     return ListTile(
//                       contentPadding: EdgeInsets.zero,
//                       title: Text(ground.ground!.name!.toCapitalize, style: primaryTextStyle(fontSize: 12)),
//                       subtitle: Text(ground.ground!.location!.toCapitalize, style: primaryTextStyle(fontSize: 10)),
//                       onTap: () {
//                         locationController.text = ground.ground!.name ?? '';
//                         tournamentController.selectedGroundId.value = ground.ground!.id!;
//                         tournamentController.isGroundVisible.value = false; // Close ground container
//                       },
//                     );
//                   },
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TournamentController extends GetxController {
//   BaseServices baseServices = BaseServices();
//   final Rx<FetchReservationGrounds> _fetchReservationGrounds = FetchReservationGrounds().obs;
//   final RxList<Ground> filteredGrounds = <Ground>[].obs; // List for filtered grounds
//   final RxBool isGroundVisible = false.obs; // Control visibility of ground container
//
//   TextEditingController tournamentNameController = TextEditingController();
//   TextEditingController tournamentLocationController = TextEditingController();
//
//   // Fetch and filter grounds based on input
//   void filterGrounds(String query) {
//     if (query.isEmpty) {
//       filteredGrounds.value = fetchReservationGrounds.data; // Reset to all grounds if query is empty
//     } else {
//       filteredGrounds.value = fetchReservationGrounds.data.where((ground) {
//         return ground.ground!.name!.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//     }
//   }
//
//   // Fetch ground reservations from API
//   fetchGroundReservation() async {
//     setLoading = true;
//     try {
//       final response = await baseServices.apiCall('get', ApiRoutes.fetchGroundReservation);
//       if (response.statusCode == 200) {
//         setFetchReservationGrounds = FetchReservationGrounds.fromJson(response.data);
//         showSnackBar('Success', response.data['result']['message']);
//       } else {
//         showSnackBar('Error', response.data['result']['message'], isError: true);
//       }
//     } catch (e) {
//       showSnackBar('Error', e.toString(), isError: true);
//     } finally {
//       setLoading = false;
//     }
//   }
// }