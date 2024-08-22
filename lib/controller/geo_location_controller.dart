import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var lat = 0.0.obs;
  var lng = 0.0.obs;
  dynamic currentPosition;
  var currentAddress = ''.obs;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Access the current position with settings
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100, // Minimum distance (in meters) to notify of changes
    );

    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }

  // Get address from latitude and longitude
  Future<void> getAddressFromLatLong(Position position) async {
    try {
      List<Placemark> placeMarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      lat.value = position.latitude;
      lng.value = position.longitude;

      Placemark place = placeMarks[0];
      currentAddress.value =
      '${place.locality}';
      log('Address In The Get Location: ${currentAddress.value}');
    } catch (e) {
      log('Error in getting address: $e');
    }
  }

  // Get the current address
  Future<void> getAddress() async {
    try {
      Position position = await _getGeoLocationPosition();
      await getAddressFromLatLong(position);
    } catch (e) {
      log('Error in getAddress: $e');
    }
  }

  // Get the current position
  Future<void> getPosition() async {
    try {
      Position position = await _getGeoLocationPosition();
      currentPosition = position;
      log('Position: $currentPosition');
      await getAddressFromLatLong(currentPosition);
    } catch (e) {
      log('Error in getPosition: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }
}
