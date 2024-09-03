import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/model/fetch_reservation_ground.dart';
import 'package:touch_down/model/get_invite_link.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/tournament_ui/add_team.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class TournamentController extends GetxController {
  BaseServices baseServices = BaseServices();
  final Rx<FetchReservationGrounds> _fetchReservationGrounds= FetchReservationGrounds().obs;
  final Rx<GetInviteLink> _getInviteLink= GetInviteLink().obs;
  // final FlutterContactPicker _contactPicker =  FlutterContactPicker();
  TextEditingController tournamentNameController= TextEditingController();
  TextEditingController tournamentLocationController= TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController teamNameController = TextEditingController();

  ///Variables
  final RxBool _isLocationTapped = false.obs;
  final RxBool _isLoading=false.obs;
  RxString selectedSportId = ''.obs;
  final RxList<Ground> _filteredGrounds = <Ground>[].obs;
  Rx<DateTimeRange?> selectedDateRange = Rx<DateTimeRange?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);
  // final Rx<List<Contact>?> _contacts = Rx(null);

  ///getters
  bool get isLoading=> _isLoading.value;
  FetchReservationGrounds get fetchReservationGrounds=> _fetchReservationGrounds.value;
  List<Ground> get filteredGrounds => _filteredGrounds;
  bool get isLocationTextFieldTapped => _isLocationTapped.value;
  // List<Contact>? get contacts => _contacts.value;
  GetInviteLink get getInviteLink=> _getInviteLink.value;

  ///setters
  set setLoading(v)=> _isLoading.value=v;
  set setFetchReservationGrounds (v)=> _fetchReservationGrounds.value=v;
  set setIsLocationTapped(bool value) { _isLocationTapped.value = value;
    if (!value) {_filteredGrounds.clear();}}
  set setGetInviteLink (v) => _getInviteLink.value=v;
  
  
  inviteLink(String teamId)async{
    try{
      final response = await baseServices.apiCall('get', '${ApiRoutes.getInviteLink}/$teamId');
      var data= response!.data;
      if(response.statusCode==200){
        setGetInviteLink= GetInviteLink.fromJson(response.data);
        showSnackBar('Success', data['message']);
      }else{
        showSnackBar('Success', data['message']??'Error Occurred',isError: true);
      }
    }catch(e){
      showSnackBar('Error', e.toString(),isError: true);
      printError(e.toString());
    }
  }
  joinInviteLink(String? joinCode )async{
    try{
      final playerId= LocalStorage.read(LocalStorage.playerId);
      final response = await baseServices.apiCall('post', ApiRoutes.joinViaLink,data: {
        'code' : joinCode,
        'playerId': playerId,
      });
      var data = response!.data;
      if(response.statusCode==200){

      }else if(response.statusCode==409){
        showSnackBar('Error', data['error'],isError: true);
      }else{
        showSnackBar('Error', data['error'],isError: true);
      }
    }catch(e){
      log('message${e.toString()}');
    }
  }
  
  addTeam(String name, String sportId) async {
    setLoading = true;
    try {
      printWarning('name: ${name}');
      printWarning('sportId: ${sportId}');

      final response = await baseServices.apiCall('post', ApiRoutes.addTeam, data: {
        'name': name,
        'sportId': sportId,
      });
      var data = response!.data;
        if (response.statusCode == 201) {
          String teamId = data['data'][0]['id'];
          inviteLink(teamId);
          printWarning('Team ID: $teamId');
        } else if (response.statusCode==400) {
          showSnackBar('Error', data['message'], isError: true);
        }else{
          showSnackBar('Error', data['message'], isError: true);
          printWarning('Id: ${data['message']}');
        }

    } catch (e) {
      showSnackBar('Error', e.toString(), isError: true);
      printError('Exception: ${e.toString()}');
    } finally {
      setLoading = false;
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

  filterGrounds(String query) {
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
      update();
    }
  }

  addTournamentApi(String sportId) async {
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
      if (response != null && response.data != null) {
        var data = response.data;
        if (response.statusCode == 201) {
          showSnackBar('Success', data['result']?['message'] ?? 'Tournament added successfully');
          Get.to(()=> AddTeamScreen(sportId: sportId,));
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
      setLoading = false;
    }
  }




  ///Functions
  Future<void> selectContact() async {
    // Contact? contact = await _contactPicker.selectContact();
    // if (contact != null) {
    //   contactController.text = contact.fullName ?? '';
    // } else {
    //   contactController.clear();
    // }
    // _contacts.value = contact == null ? null : [contact];
  }


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
