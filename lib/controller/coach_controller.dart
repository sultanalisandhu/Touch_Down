import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/model/coach_monthly_availability.dart';
import 'package:touch_down/model/coach_time_availability.dart';
import 'package:touch_down/model/get_coach_by_location.dart';
import 'package:touch_down/model/get_coach_by_sport_id.dart';
import 'package:touch_down/model/user_detail_model.dart';
import 'package:touch_down/services/user_profile_services.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/auth/otp_screen.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';
import 'package:intl/intl.dart';

class CoachController extends GetxController {
  BaseServices baseServices = BaseServices();
  final HomeController homeController= Get.find<HomeController>(tag: 'homeController');
  ///Model Type Variable
  final Rx<UserDetailModel> _userDetailModel= UserDetailModel().obs;
  final Rx<CoachMonthlyAvailability> _coachMonthlyAvailability = CoachMonthlyAvailability().obs;
  final Rx<CoachTimeAvailability> _coachTimeAvailability = CoachTimeAvailability().obs;
  final Rx<GetCoachBySportIdModel> _getCoachBySportIdModel = GetCoachBySportIdModel().obs;
  final Rx<GetCoachByLocationMOdel> _getCoachByLocationModel = GetCoachByLocationMOdel().obs;

  ///Text Editing Controllers
  TextEditingController cNameController = TextEditingController();
  TextEditingController cEmailController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  TextEditingController cMobileController = TextEditingController();
  TextEditingController cLocationController = TextEditingController();
  TextEditingController cAddressController = TextEditingController();
  TextEditingController cDescriptionController = TextEditingController();
  TextEditingController cFeeController = TextEditingController();
  TextEditingController cGroupFeeController = TextEditingController();
  TextEditingController cAdharCardController = TextEditingController();
  TextEditingController cCertificateController = TextEditingController();

  /// Variables
  final RxBool _isLoading=false.obs;
  var selectedDate = DateTime.now().obs;
  final RxBool isTermsAccepted = false.obs;
  RxBool showPassword = true.obs;
  RxString selectedImagePath = ''.obs;
  RxString imageUrl = ''.obs;
  RxString selectedTime = ''.obs;
  RxString isAvailable = ''.obs;
  RxString selectedSlotId = ''.obs;
  Rx<DateTime?> selectedAvailabilityDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);


  ///getters
  bool get isLoading => _isLoading.value;
  UserDetailModel get userDetailModel=> _userDetailModel.value;
  CoachMonthlyAvailability get coachMonthlyAvailability=> _coachMonthlyAvailability.value;
  CoachTimeAvailability get coachTimeAvailability=> _coachTimeAvailability.value;
  GetCoachBySportIdModel get coachBySportId=> _getCoachBySportIdModel.value;
  GetCoachByLocationMOdel get coachByLocation=> _getCoachByLocationModel.value;


  ///setters
  set setLoading(v)=> _isLoading.value=v;
  set setUserDetailModel(v)=> _userDetailModel.value=v;
  set setCoachMonthlyAvailability(v)=> _coachMonthlyAvailability.value=v;
  set setCoachTimeAvailability(v)=> _coachTimeAvailability.value=v;
  set setGetCoachBySportIdModel(v)=> _getCoachBySportIdModel.value=v;
  set setGetCoachByLocationModel(v)=> _getCoachByLocationModel.value=v;


  getCoachBySportId(String sportId)async{
    try{
      final response= await baseServices.apiCall('get', '${ApiRoutes.getCoachBySportId}/$sportId');
      var data= response!.data;
      if(response.statusCode==200){
        setGetCoachBySportIdModel= GetCoachBySportIdModel.fromJson(response.data);
      }else{
        showSnackBar('Error', data['message']);
      }
    }catch(e){
      showSnackBar('Caught Error', e.toString(),isError: true);
      debugPrint('Caught Error ${e.toString()}');
    }
  }
  getCoachByLocation(String sportId)async{
    try{
      final response= await baseServices.apiCall('post', ApiRoutes.getCoachByLocation,data: {
        'location' : '',
      });
      var data= response!.data;
      if(response.statusCode==200){
        setGetCoachByLocationModel= GetCoachByLocationMOdel.fromJson(response.data);
      }else{
        showSnackBar('Error', data['message']);
      }
    }catch(e){
      showSnackBar('Caught Error', e.toString(),isError: true);
      debugPrint('Caught Error ${e.toString()}');
    }
  }

  void coachRegister(String sportId,String role) async {
    setLoading=true;
    try {
      final response = await baseServices.apiCall('post', ApiRoutes.registerUser, data: {
        'email': cEmailController.text.trim(),
        'password': cPasswordController.text.trim(),
        'name': cNameController.text.trim(),
        'phone': cMobileController.text.trim(),
        'location': cLocationController.text.trim(),
        'address': cAddressController.text.trim(),
        'sportId': sportId,
        'userRole': role,
        'avatar': imageUrl.value.toString(),
      });
      var data = response!.data;
      if (response.statusCode == 201) {
        UserProfileService.saveUserProfileData(data);
        // String coachId = data['result']['user']['coach']['id'];
        // LocalStorage.write(LocalStorage.coachId, coachId);
        // printWarning('Debug: Saved coach ID = $coachId');
        showSnackBar('Success', data['result']['message'].toString());
        Get.to(() => OtpScreen(email: cEmailController.text));
      } else {
        showSnackBar('Error', data['result']['message'].toString(), isError: true);
        print('Debug: Error Status Code = ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
    }
    setLoading=false;
  }

  void updateCoachDetails(BuildContext context) async {
    final String coachId =  LocalStorage.read(LocalStorage.coachId);
    try {
      final requestData = {
        'name': cNameController.text.trim(),
        'email': cEmailController.text.trim(),
        'phone': cMobileController.text.trim(),
        'location': cLocationController.text.trim(),
        'address': cAddressController.text.trim(),
        'coachId': coachId,
        'fee': cFeeController.text.trim(),
        'groupFee': cGroupFeeController.text.trim(),
        'description': cDescriptionController.text.trim(),
        'adhaarCard': cAdharCardController.text.trim(),
        'certificate': ['cCertificateController.text.trim()'],
      };

      final response = await baseServices.apiCall('patch', ApiRoutes.updateCoachDetails, data: requestData);
      var data = response!.data;
      if (response.statusCode == 201) {
        // getUserDetails();
        Navigator.pop(context);
        Navigator.pop(context);
        showSnackBar('Success', data['result']['message']);
      } else {
        showSnackBar('Error', data['result']['message'],isError: true);
      }
    } catch (e) {

      showSnackBar('CError', e.toString(), isError: true);
      debugPrint('catch Error Response : ${e.toString()}');
    }
  }


  getUserDetails()async{
    setLoading=true;
    try{
      String userId = LocalStorage.read(LocalStorage.userId);
      debugPrint('userId To ENd Point $userId');
      final response= await baseServices.apiCall('get', '${ApiRoutes.userDetailsByID}/$userId');
      var data=response!.data;
      if(response.statusCode==200){
        setUserDetailModel= UserDetailModel.fromJson(response.data);
      }else{
        showSnackBar('Error', data['status'],isError: true);
      }
    }catch(e){
      showSnackBar('Caught Error', e.toString(),isError: true);
    }
    setLoading=false;
  }


  getCoachMonthAvailability({required int month, required int year}) async {
    try {
      String coachId = LocalStorage.read(LocalStorage.coachId);
      final response = await baseServices.apiCall('post', ApiRoutes.getCoachMonth, data: {
        'coachId': coachId,
        'month': month.toString(),
        'year': year.toString(),
      });
      printWarning('Month Selected ${month.toString()}');
      printWarning('Year Selected ${year.toString()}');
        var data= response!.data;
        if (response.statusCode == 200) {
          setCoachMonthlyAvailability = CoachMonthlyAvailability.fromJson(data);
        } else {
          showSnackBar('Error', data['message'], isError: true);
        }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
    }
  }

  getCoachTimeAvailability(DateTime selectedDate) async {
    try {
      String coachId = LocalStorage.read(LocalStorage.coachId);
      final response = await baseServices.apiCall('post', ApiRoutes.getCoachTime, data: {
        'coachId': coachId,
        'date': DateFormat('yyyy-MM-dd').format(selectedDate),
      });
      printWarning('Date Selected ${selectedDate.toString()}');
      var data = response!.data;
      if (response.statusCode == 200) {
        setCoachTimeAvailability = CoachTimeAvailability.fromJson(response.data);
      } else {
        showSnackBar('Error', data['message'], isError: true);
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
    }
  }

  createSession(BuildContext context) async {
    try {
      String coachId = LocalStorage.read(LocalStorage.coachId);
      String userId = LocalStorage.read(LocalStorage.userId);
      final response = await baseServices.apiCall('post', ApiRoutes.getCoachTime, data: {
        'coachId': coachId,
        'userId': userId,
        'slotId': selectedSlotId.value,
        'totalPaymentAmount': 100,
        'totalAmount': 100,
        'date': selectedDate.value,
        'location': cAddressController.text.trim(),
      });
      printWarning('Selected slotId ${selectedSlotId.value.toString()}');
      var data = response!.data;
      if (response.statusCode == 201) {
        showSnackBar('Success', data['result']['message']);
        Navigator.pop(context);
      } else {
        showSnackBar('Error', data['result']['message'], isError: true);
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
    }
  }
  
  addAvailability(context) async{
    setLoading=true;
    try{
      String coachId = LocalStorage.read(LocalStorage.coachId);
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedAvailabilityDate.value!);
      DateTime startDateTime = DateTime(
        0,1,1,
        startTime.value!.hour,
        startTime.value!.minute,
      );
      DateTime endDateTime = DateTime(
        0,1,1,
        endTime.value!.hour,
        endTime.value!.minute,
      );
      String formattedStartTime = DateFormat('HH:mm').format(startDateTime);
      String formattedEndTime = DateFormat('HH:mm').format(endDateTime);
      
      final response= await baseServices.apiCall('post', ApiRoutes.addCoachAvailability,data: {
        'coachId': coachId,
        'slotDuration': 60,
        'startTime': formattedStartTime,
        'endTime': formattedEndTime,
        'date': formattedDate,
      });
      var data = response!.data;
      if(response.statusCode==201){
        Navigator.pop(context);
        showSnackBar('Success', data['result']['message']);
      }else{
        showSnackBar('Success', data['result']['message'],isError: true);
        debugPrint('${response.statusCode}');
      }
    }catch(e){
      showSnackBar('Caught Error', e.toString(),isError: true);
    }
    setLoading=false;
  }

  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      debugPrint('File Path: ${selectedImagePath.value}');
      uploadImage();
    } else {
      selectedImagePath.value = '';
      showSnackBar('Error', 'No image selected', isError: true);
    }
  }

  void uploadImage() async {
    if (selectedImagePath.value.isEmpty) {
      showSnackBar('Error', 'No image selected', isError: true);
      return;
    }
    try {
      File imageFile = File(selectedImagePath.value);
      String fileName = imageFile.path.split('/').last;
      dio.FormData formData = dio.FormData.fromMap({
        'image': await dio.MultipartFile.fromFile(selectedImagePath.value, filename: fileName),
      });

      debugPrint('FormData: ${formData.fields}');
      debugPrint('File: ${formData.files}');

      final response = await baseServices.apiCall('post', ApiRoutes.uploadImg, data: formData);
      var data = response!.data;
      if (response.statusCode == 201) {
        imageUrl.value= data['file']['imageUrl'];
        showSnackBar('Success', data['message'].toString());
      } else {
        showSnackBar('Error', data['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(), isError: true);
    }
  }



  ///Functions
  void incrementMonth() {
    DateTime currentDate = selectedDate.value;
    if (currentDate.month == 12) {
      selectedDate.value = DateTime(currentDate.year + 1, 1, currentDate.day);
    } else {
      selectedDate.value = DateTime(currentDate.year, currentDate.month + 1, currentDate.day);
    }
    getCoachMonthAvailability(
      month: selectedDate.value.month,
      year: selectedDate.value.year,
    );
  }

  void decrementMonth() {
    DateTime currentDate = selectedDate.value;
    if (currentDate.month == 1) {
      selectedDate.value = DateTime(currentDate.year - 1, 12, currentDate.day);
    } else {
      selectedDate.value = DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    }
    getCoachMonthAvailability(
      month: selectedDate.value.month,
      year: selectedDate.value.year,
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedAvailabilityDate.value) {
      selectedAvailabilityDate.value = pickedDate;
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


  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
  }
}
