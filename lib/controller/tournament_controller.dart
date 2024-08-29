import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/model/fetch_reservation_ground.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/tournament_ui/add_team.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class TournamentController extends GetxController {
  BaseServices baseServices = BaseServices();
  final Rx<FetchReservationGrounds> _fetchReservationGrounds= FetchReservationGrounds().obs;
  final RxList<Ground> _filteredGrounds = <Ground>[].obs;
  final RxBool _isLocationTapped = false.obs;

  TextEditingController tournamentNameController= TextEditingController();
  TextEditingController tournamentLocationController= TextEditingController();

  ///Variables
  final RxBool _isLoading=false.obs;
  RxString selectedSportId = ''.obs;
  Rx<DateTimeRange?> selectedDateRange = Rx<DateTimeRange?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);

  ///getters
  bool get isLoading=> _isLoading.value;
  FetchReservationGrounds get fetchReservationGrounds=> _fetchReservationGrounds.value;
  List<Ground> get filteredGrounds => _filteredGrounds;
  bool get isLocationTextFieldTapped => _isLocationTapped.value;

  ///setters
  set setLoading(v)=> _isLoading.value=v;
  set setFetchReservationGrounds (v)=> _fetchReservationGrounds.value=v;
  set setIsLocationTapped(bool value) { _isLocationTapped.value = value;
    if (!value) {
      _filteredGrounds.clear(); // Clear the grounds when the text field is not tapped
    }
  }


  fetchGroundReservation()async{
    setLoading=true;
    try{
      final userId= LocalStorage.read(LocalStorage.userId);
      printWarning(userId);
      final response= await baseServices.apiCall('get', '${ApiRoutes.fetchGroundReservation}/$userId');
      var data= response!.data;
      if(response.statusCode==200){
        setFetchReservationGrounds= FetchReservationGrounds.fromJson(response.data);
        showSnackBar('Success', data['result']['message']);
      }else{
        showSnackBar('Error', data['result']['message'],isError: true);
      }

    }catch(e){
      showSnackBar('Error', e.toString(),isError: true);
    }finally{
      setLoading=false;
    }
  }

  void filterGrounds(String query) {
    // Ensure that grounds are fetched before filtering
    if (_fetchReservationGrounds.value.result?.data != null) {
      final grounds = _fetchReservationGrounds.value.result!.data!.map((data) => data.ground!).toList();

      if (query.isEmpty) {
        _filteredGrounds.value = grounds; // Show all grounds if no query
      } else {
        _filteredGrounds.value = grounds.where((ground) {
          return ground.location?.toLowerCase().contains(query.toLowerCase()) ?? false;
        }).toList(); // Filter based on the query
      }
      update(); // Notify listeners about the changes
    }
  }





  addTournamentApi() async {
    setLoading = true;
    try {
      DateTime? startDateTime;
      if (selectedDateRange.value != null && startTime.value != null) {
        startDateTime = DateTime(
          selectedDateRange.value!.start.year,
          selectedDateRange.value!.start.month,
          selectedDateRange.value!.start.day,
          startTime.value!.hour,
          startTime.value!.minute,
        );
      }

      DateTime? endDateTime;
      if (selectedDateRange.value != null && endTime.value != null) {
        endDateTime = DateTime(
          selectedDateRange.value!.end.year,
          selectedDateRange.value!.end.month,
          selectedDateRange.value!.end.day,
          endTime.value!.hour,
          endTime.value!.minute,
        );
      }

      // Custom formatting for DateTime without milliseconds
      String formatDateTime(DateTime? dateTime) {
        if (dateTime == null) return '';
        return "${dateTime.toIso8601String().split('.')[0]}"; // Removes milliseconds
      }

      // Print statements for debugging
      print('Sending to API: {');
      print('Name: ${tournamentNameController.text.trim()}');
      print('Sport ID: ${selectedSportId.value}');
      print('Location: ${tournamentLocationController.text.trim()}');
      print('Start DateTime: $startDateTime');
      print('End DateTime: $endDateTime');
      print('}');

      final response = await baseServices.apiCall('post', ApiRoutes.addTournament, data: {
        'name': tournamentNameController.text.trim(),
        'sportId': selectedSportId.value,
        'location': tournamentLocationController.text.trim(),
        'startDate': formatDateTime(startDateTime),
        'endDate': formatDateTime(endDateTime),
      });

      // Check if response is not null and has data
      if (response != null && response.data != null) {
        var data = response.data;
        if (response.statusCode == 201) {
          showSnackBar('Success', data['result']?['message'] ?? 'Tournament added successfully');
          Get.to(() => AddTeam());
        } else {
          showSnackBar('Error', data['result']?['message']?.toString() ?? 'An error occurred', isError: true);
          print('Debug: Error Status Code = ${response.statusCode}');
        }
      } else {
        showSnackBar('Error', 'Response data is null', isError: true);
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
      printError(e.toString());
    } finally {
      setLoading = false; // Ensure loading is set to false in finally block
    }
  }




  


  ///Functions
  Future<void> selectDateRange(BuildContext context) async {
    DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: selectedDateRange.value,
    );

    if (pickedRange != null && pickedRange != selectedDateRange.value) {
      selectedDateRange.value = pickedRange;
      print('Selected Date Range: ${selectedDateRange.value!.start} - ${selectedDateRange.value!.end}');
    }
  }

  Future<void> selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      if (isStartTime) {
        startTime.value = pickedTime;
      } else {
        endTime.value = pickedTime;
      }
    }
  }
  @override
  void onInit() {
    super.onInit();
    fetchGroundReservation();
  }
}
