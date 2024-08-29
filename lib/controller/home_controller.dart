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

  /// variables
  final RxBool _isLoading=false.obs;
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  final RxBool _isTextFieldTapped = false.obs;
  Timer? timer;
  final RxList<Data> _filteredSports = <Data>[].obs;
  final Rx<Data?> _selectedSport = Rx<Data?>(null);


  /// getters
  AllSportsModel get allSportsModel=> _allSportsModel.value;
  bool get isLoading=> _isLoading.value;
  List<Data> get filteredSports => _filteredSports.toList();
  Data? get selectedSport => _selectedSport.value;
  bool get isTextFieldTapped => _isTextFieldTapped.value;


  /// setters
  set setAllSportsModel(v)=> _allSportsModel.value=v;
  set setLoading(v)=> _isLoading.value=v;
  set setSelectedSport(v) => _selectedSport.value = v;
  set setIsTextFieldTapped(v) => _isTextFieldTapped.value = v;



  Future<void> getAllSports() async {
    setLoading = true;
    try {
      final response = await baseServices.apiCall('get', ApiRoutes.allSports);
      if (response!.statusCode == 200) {
        setAllSportsModel = AllSportsModel.fromJson(response.data);
        // Initialize _filteredSports with all sports data
        _filteredSports.value = allSportsModel.result?.data ?? [];
      } else {
        showSnackBar('Error', response.data['message'], isError: true);
      }
    } catch (e) {
      showSnackBar('Error', e.toString(), isError: true);
    }finally{
      setLoading=false;
    }
  }

  void filterSports(String query) {
    if (query.isEmpty) {
      _filteredSports.value = allSportsModel.result?.data ?? [];
    } else {
      _filteredSports.value = (allSportsModel.result?.data ?? [])
          .where((sport) =>
      sport.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    }
    update();
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
    getAllSports();
    pageController = PageController(initialPage: 0);
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
