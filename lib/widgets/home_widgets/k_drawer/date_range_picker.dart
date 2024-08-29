import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/controller/tournament_controller.dart';
import 'package:touch_down/utils/constants.dart';

class SelectDateRangeExample extends StatelessWidget {
  final TournamentController controller;

  const SelectDateRangeExample({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Date',
            style: primaryTextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () => controller.selectDateRange(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    controller.selectedDateRange.value == null
                        ? 'Select date'
                        : '${formatDate(controller.selectedDateRange.value!.start)} - ${formatDate(controller.selectedDateRange.value!.end)}',
                    style: primaryTextStyle(fontSize: 10),
                  ),
                  const Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  /// Helper method to format the date as YYYY-MM-DD
  String formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
