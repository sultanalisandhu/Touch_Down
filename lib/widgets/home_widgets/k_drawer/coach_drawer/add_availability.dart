import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:touch_down/controller/coach_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';
import 'package:touch_down/widgets/circular_loading.dart';
import 'package:touch_down/widgets/k_app_bar/k_app_bar.dart';
import 'package:touch_down/widgets/k_buttons.dart';


class AddAvailabilitySlot extends StatelessWidget {
   AddAvailabilitySlot({super.key});

   final CoachController coachController = Get.find<CoachController>(tag: 'coachController');

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        appBar: kAppBar(titleText: 'Add Availability Slots'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date",
                style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w600),
              ),
              2.height,
              GestureDetector(
                onTap: () => coachController.selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        coachController.selectedAvailabilityDate.value != null
                            ? DateFormat('dd/MM/yyyy').format(coachController.selectedAvailabilityDate.value!)
                            : 'Select date',
                        style: primaryTextStyle(fontSize: 12),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              2.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                      ),
                     1.height,
                      GestureDetector(
                        onTap: () => coachController.selectTime(context, true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                coachController.startTime.value != null
                                    ? coachController.startTime.value!.format(context)
                                    : 'Select time',
                                style: primaryTextStyle(fontSize: 12),
                              ),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End Time",
                        style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w600),
                      ),
                      1.height,
                      GestureDetector(
                        onTap: () => coachController.selectTime(context,false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                coachController.endTime.value != null
                                    ? coachController.endTime.value!.format(context)
                                    : 'Select time',
                                style: primaryTextStyle(fontSize: 12),
                              ),
                              const Icon(Icons.access_time),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              5.height,
              coachController.isLoading
                  ? kCircularLoading()
                  : Center(
                child: kTextButton(
                  onPressed: (){
                    coachController.addAvailability(context);
                  },
                  btnText: 'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}