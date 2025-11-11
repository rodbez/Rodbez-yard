import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomepageController extends GetxController {
  static HomepageController get instance => Get.find();

  final Rx<GoogleMapController?> mapController = Rx<GoogleMapController?>(null);
  final RxSet<Marker> markers = <Marker>{}.obs;
  final Rx<LatLng?> currentPosition = Rx<LatLng?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initLocationAndCabs();
  }

  /// ✅ Initialize user location + cabs
  Future<void> _initLocationAndCabs() async {
    isLoading.value = true;

    try {
      // Step 1: Request permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Get.snackbar('Location Error', 'Please enable location access.');
        isLoading.value = false;
        return;
      }

      // Step 2: Get current location
      final Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition.value = LatLng(pos.latitude, pos.longitude);

      // Step 3: Add markers
      await _addNearbyCabs();
      _fitAllMarkers();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch location: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Generate 15 random cab markers within ~100km radius
  Future<void> _addNearbyCabs() async {
    markers.clear();

    if (currentPosition.value == null) return;

    final BitmapDescriptor cabIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(64, 64)),
      'assets/icon/carMarker.png',
    );

    final random = Random();
    const double earthRadius = 6371; // km
    const double radiusInKm = 100; // 100 km radius

    for (int i = 0; i < 15; i++) {
      // Random angle and distance
      final double angle = random.nextDouble() * 2 * pi;
      final double distance = sqrt(random.nextDouble()) * radiusInKm;

      // Convert distance to lat/lng offsets
      final double latOffset = (distance / earthRadius) * (180 / pi);
      final double lngOffset = latOffset / cos(currentPosition.value!.latitude * pi / 180);

      final LatLng newLoc = LatLng(
        currentPosition.value!.latitude + latOffset * cos(angle),
        currentPosition.value!.longitude + lngOffset * sin(angle),
      );

      markers.add(
        Marker(
          markerId: MarkerId('cab_$i'),
          position: newLoc,
          icon: cabIcon,
        ),
      );
    }

    // ✅ Add user's own marker
    // markers.add(
    //   Marker(
    //     markerId: const MarkerId('user'),
    //     position: currentPosition.value!,
    //   ),
    // );
  }


  /// ✅ Map Created Callback
  void onMapCreated(GoogleMapController controller) async {
    mapController.value = controller;

    // Wait for markers to be added completely
    await Future.delayed(const Duration(milliseconds: 500));

    // Then fit all markers in view automatically
    await _fitAllMarkers();
  }

  /// ✅ Fit all markers in screen automatically
  Future<void> _fitAllMarkers() async {
    if (markers.isEmpty || mapController.value == null) return;

    LatLngBounds? bounds;

    // Calculate min/max lat/lng
    double? minLat, maxLat, minLng, maxLng;
    for (var marker in markers) {
      if (minLat == null) {
        minLat = maxLat = marker.position.latitude;
        minLng = maxLng = marker.position.longitude;
      } else {
        minLat = marker.position.latitude < minLat ? marker.position.latitude : minLat;
        maxLat = marker.position.latitude > maxLat! ? marker.position.latitude : maxLat;
        minLng = marker.position.longitude < minLng! ? marker.position.longitude : minLng;
        maxLng = marker.position.longitude > maxLng! ? marker.position.longitude : maxLng;
      }
    }

    bounds = LatLngBounds(
      southwest: LatLng(minLat!, minLng!),
      northeast: LatLng(maxLat!, maxLng!),
    );

    // Ensure the map is ready before animating
    await Future.delayed(const Duration(milliseconds: 300));

    // Animate camera to fit all markers properly
    try {
      await mapController.value!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 80), // padding
      );
    } catch (e) {
      // fallback if bounds invalid (e.g., all points same)
      await mapController.value!.animateCamera(
        CameraUpdate.newLatLngZoom(currentPosition.value!, 12),
      );
    }
  }


  Future<void> refreshCabs() async {
    await _initLocationAndCabs();
    await Future.delayed(const Duration(milliseconds: 500));
    await _fitAllMarkers();
  }


  @override
  void onClose() {
    mapController.value?.dispose();
    super.onClose();
  }
}
