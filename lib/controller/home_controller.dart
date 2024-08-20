import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:touch_down/api_client/api_routes.dart';
import 'package:touch_down/api_client/base_services.dart';
import 'package:touch_down/model/all_sports_model.dart';
import 'package:touch_down/utils/asset_utils.dart';
import 'package:touch_down/widgets/k_snack_bar.dart';

class HomeController extends GetxController {
  BaseServices baseServices= BaseServices();
  final Rx<AllSportsModel> _allSportsModel= AllSportsModel().obs;
  final RxBool _isLoading=false.obs;
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  Timer? timer;
  /// getters
  AllSportsModel get allSportsModel=> _allSportsModel.value;
  bool get isSportsLoading=> _isLoading.value;

  /// setters
  set setAllSportsModel(v)=> _allSportsModel.value=v;
  set setSportLoading(v)=> _isLoading.value=v;

  getAllSports() async{
    setSportLoading=true;
    try{
      final response = await baseServices.apiCall('get', ApiRoutes.allSports);
      if(response!.statusCode==200){
       setAllSportsModel = AllSportsModel.fromJson(response.data);
       setSportLoading = false;
       update();
      }else{
        showSnackBar('Error', response.data['message'], isError: true);
        setSportLoading = false;
        update();
      }
    }catch(e){
      showSnackBar('Error', e.toString(),isError: true);
    }
  }







  final List<String> carouselPictures = [
    ImgUtils.sliderImg,
    ImgUtils.welcomeImage,
    ImgUtils.bgImg,
    ImgUtils.sliderImg2
  ];


  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
    getAllSports();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (currentIndex.value < carouselPictures.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        pageController.jumpToPage(0);
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
