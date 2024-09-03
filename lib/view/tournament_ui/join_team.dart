import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:touch_down/controller/tournament_controller.dart';
import 'package:touch_down/controller/deep_linking_controller.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/utils/extensions/extensions.dart';

class JoinTeamScreen extends GetView<TournamentController> {
  final String? joinCode;
  const JoinTeamScreen({super.key, required this.joinCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Team', style: primaryTextStyle()),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (joinCode != null)
              Text('Join Code: $joinCode', style: primaryTextStyle()),
            TextButton(
              onPressed: () {
                DeepLinkController.reset();
                Get.back();
              },
              child: Text('CANCEL', style: primaryTextStyle(fontSize: 12)),
            ),
            2.height,
            TextButton(
              onPressed: () {
                if (joinCode != null && joinCode!.isNotEmpty) {
                  controller.joinInviteLink(joinCode);
                } else {
                  Get.snackbar('Error', 'Invalid join code', snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Join Team', style: primaryTextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
