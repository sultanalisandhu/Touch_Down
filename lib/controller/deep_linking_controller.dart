import 'dart:async';
import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:touch_down/utils/constants.dart';
import 'package:touch_down/view/tournament_ui/join_team.dart';

class DeepLinkController extends GetxController {
 static final AppLinks _appLinks = AppLinks();
 static String _code = '';
 static String get code => _code;
 static bool get hasCode => _code.isNotEmpty;
 static void reset() => _code = '';
 StreamSubscription? _streamSubscription;
 Future<void> initUrlHandler() async {
  try {
   final Uri? initialUri = await _appLinks.getInitialLink();
   printWarning('initialURI: $initialUri');
   if (initialUri != null) {
    print('_linkHandler start');
    _linkHandler(initialUri);
   }
   _streamSubscription = _appLinks.uriLinkStream.listen(
        (Uri? uri) => _linkHandler(uri),
    onError: (error) {
     printWarning('Failed to handle incoming link: $error');
    },
   );
  } catch (e) {
   log('Error in handling URI: ${e.toString()}');
  }
 }

 /// Handles the received URI and extracts the join code
 static void _linkHandler(Uri? uri) {
  printWarning('_linkHandler received URI: ${uri!.path}');
  if (uri == null || uri.queryParameters.isEmpty) {
   printWarning('Received an empty or invalid link.');
   return;
  }

  // Extract the 'code' parameter from the URI
  final String? receivedCode = uri.queryParameters['code'];
  if (receivedCode != null && receivedCode.isNotEmpty) {
   _code = receivedCode;
   printWarning('receivedCode received: $receivedCode');
   printWarning('Join code received: $_code');
   _navigateToJoinScreen(_code);
  } else {
   printWarning('No valid join code found in the link.');
  }
 }

 /// Navigates to the JoinTeamScreen with the extracted join code
 static void _navigateToJoinScreen(String joinCode) {
  Get.to(() => JoinTeamScreen(joinCode: joinCode));
 }

 @override
 void onInit() {
  super.onInit();
  initUrlHandler();
 }

 @override
 void onClose() {
  _streamSubscription?.cancel();
  super.onClose();
 }
}
