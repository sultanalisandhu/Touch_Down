import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class UploadImageController extends GetxController{
  ClassApiServices apiServices = ClassApiServices();

  RxString selectedImagePath = ''.obs;
  RxString imageUrl = ''.obs;
  final RxBool _isLoading= false.obs;
  
  
  
  
  
  
  
  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      printWarning('File Patth: ${selectedImagePath.value}');
      uploadImage();
    } else {
      selectedImagePath.value = '';
      showSnackBar('Error', 'No imagee selected', isError: true);
    }
  }

  void uploadImage() async {
    if (selectedImagePath.value.isEmpty) {
      showSnackBar('Error', 'No image selected', isError: true);
      return;
    }
    try {
      final response = await ClassApiServices.apiCall('post', ApiRoutes.uploadImg,
        isLoading: _isLoading,
          data: {
        'image': selectedImagePath.value
      },

      );
      var data = response!.data;
      if (response.statusCode == 201) {
        imageUrl.value= data['file']['imageUrl'];
        showSnackBar('Success', data['message'].toString());
      } else {
        showSnackBar('Error', data['message'].toString(), isError: true);
      }
    } catch (e) {
      showSnackBar('Caught Error', e.toString(), isError: true);
    }
  }
  
}