import 'package:flutter/material.dart';
import 'package:touch_down/utils/local_storage.dart';
import 'package:touch_down/view/profile_ui/coach_profile_ui/coach_profile_screen.dart';
import 'package:touch_down/view/profile_ui/user_profile_ui/user_profile_screen.dart';

class UserProfileService {
  static void saveUserProfileData(Map<String, dynamic> data) {
    String userId = data['result']['user']['id'];
    print('UsrID: ${userId}');
    String bearerToken= data['result']['token'];
    LocalStorage.write(LocalStorage.userId, userId);
    LocalStorage.write(LocalStorage.bearerToken, bearerToken);


    if (data['result']['user']['coach'] != null && data['result']['user']['coach'].isNotEmpty) {
      String coachId = data['result']['user']['coach']['id'];
      LocalStorage.write(LocalStorage.coachId, coachId);
    }

    if (data['result']['user']['player'] != null && data['result']['user']['player'].isNotEmpty) {
      String playerId = data['result']['user']['player']['id'];
      LocalStorage.write(LocalStorage.playerId, playerId);
    }
    if (data['result']['user']['agency'] != null && data['result']['user']['agency'].isNotEmpty) {
      String playerId = data['result']['user']['agency']['id'];
      LocalStorage.write(LocalStorage.playerId, playerId);
    }
  }

  static Widget getProfileScreen() {
    String? coachId = LocalStorage.read(LocalStorage.coachId);
    String? playerId = LocalStorage.read(LocalStorage.playerId);
    String? agencyId = LocalStorage.read(LocalStorage.agencyId);

    if (coachId != '') {
      return CoachProfileScreen();
    } else if (playerId != '') {
      return UserProfileScreen();
    } else {
      return UserProfileScreen();
    }
  }
}
