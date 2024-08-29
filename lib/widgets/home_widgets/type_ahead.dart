import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:touch_down/controller/home_controller.dart';
import 'package:touch_down/model/all_sports_model.dart';
import 'package:touch_down/utils/constants.dart';

class TypeAhead extends StatelessWidget {
  TypeAhead({super.key});

  final TextEditingController _sportController = TextEditingController();
  final HomeController homeController = Get.find<HomeController>(tag: 'homeController');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mQ.height * 0.1,
      width: mQ.width,
      child: TypeAheadField<Data>(
        suggestionsCallback: (search) =>  _filterSports(search),
        controller: _sportController,
        builder: (context,controller,focusNode){
          return TextFormField(
            style: primaryTextStyle(fontSize: 12),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.lightGreyColor,
                  width: 0.1.h,
                ),
                borderRadius: BorderRadius.circular(0.8.h),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.lightGreyColor,
                  width: 0.1.h,
                ),
                borderRadius: BorderRadius.circular(0.8.h),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.8.h),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.4.h,
                horizontal: 1.6.h,
              ),
              suffixIconConstraints: BoxConstraints.tightFor(
                width: 5.0.h,
                height: 5.h,
              ),
              hintStyle: primaryTextStyle(
                fontSize: 10,
                color: AppColor.blackColor,
              ),
              suffixIcon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColor.primaryColor,
              ),
              isCollapsed: true,
              filled: true,
              fillColor: AppColor.whiteColor,
              hintText: 'Enter sport',
              enabled: true,
            ),
          );
        },
        itemBuilder: (context, sport) {
          print('Building item for sport: ${sport.name}');
          return _buildSportInfo(sport);
        },
        onSelected: (Data sport) {
          print('Sport selected: ${sport.name}');
          _sportController.text = sport.name ?? '';
        },
      ),
    );
  }

  // Method to filter sports based on search input
  List<Data> _filterSports(String search) {
    final sports = homeController.allSportsModel.result?.data ?? [];
    print('Total sports available: ${sports.length}');
    final filtered = sports
        .where((sport) => sport.name != null && sport.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
    print('Filtered sports: ${filtered.map((s) => s.name).toList()}');
    return filtered;
  }


  // Widget to build the sport info
  Widget _buildSportInfo(Data sport) {
    return ListTile(
      title: Text(
        sport.name ?? 'No Sports',
        style: primaryTextStyle(fontSize: 10),
      ),
    );
  }
}