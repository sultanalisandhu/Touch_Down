import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/nav_bar/navigation_menu.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class CoachController extends GetxController {
  BaseServices baseServices = BaseServices();

  var selectedDate = DateTime.now().obs;
  TextEditingController cNameController = TextEditingController();
  TextEditingController cEmailController = TextEditingController();
  TextEditingController cMobileController = TextEditingController();
  TextEditingController cLocationController = TextEditingController();
  TextEditingController cAddressController = TextEditingController();
  TextEditingController cDescriptionController = TextEditingController();

  /// Variables
  final RxBool isTermsAccepted = false.obs;
  RxString selectedImagePath = ''.obs;
  RxString imageUrl = ''.obs;

  void coachRegister(String sportId) async {
    final String userId = LocalStorage.instance.currentUserId.toString();
    print('Debug: userId = $userId');print('Debug: sportId = $sportId');
    final response = await baseServices.apiCall('post', ApiRoutes.coachRegister, data: {
      'name': cNameController.text.trim(),
      'email': cEmailController.text.trim(),
      'phone': cMobileController.text.trim(),
      'location': cLocationController.text.trim(),
      'address': cAddressController.text.trim(),
      'userId': userId,
      'sportId': sportId,
      'avatar': imageUrl.value,
    });

    var data = response!.data;
    try {
      if (response.statusCode == 201) {
        showSnackBar('Success', data['result']['message'].toString());
        await Future.delayed(const Duration(seconds: 2));
        Get.offAll(() => CustomBottomBar());
      } else {
        showSnackBar('Error', data['result']['message'].toString(), isError: true);
        print('Debug: sportId = ${response.statusCode}');
      }
    } catch (e) {
      showSnackBar('Error', data['result']['message'].toString(), isError: true);
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
      if (response.statusCode == 200) {
        imageUrl.value= data['file']['imageUrl'];
        showSnackBar('Success', data['message'].toString());

      } else {
        showSnackBar('Error', data['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(), isError: true);
    }
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

  @override
  void onInit() {
    super.onInit();
  }
}
