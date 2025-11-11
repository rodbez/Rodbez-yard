import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rodbez_yard/features/personalization/homepage/controller/homepage_controller.dart';
import 'package:rodbez_yard/features/personalization/homepage/view/widgets/homepage_appbar.dart';
import 'package:rodbez_yard/features/personalization/homepage/view/widgets/homepage_drawer.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomepageController());

    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: HomepageAppbar(),
      drawer: HomepageDrawer(),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: RColors.yellow,backgroundColor: RColors.white),
            );
          }

          if (controller.currentPosition.value == null) {
            return const Center(
              child: Text('Unable to get location'),
            );
          }

          return RefreshIndicator(
            onRefresh: controller.refreshCabs,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: controller.currentPosition.value!,
                zoom: 12,
              ),
              onMapCreated: controller.onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              markers: controller.markers,
            ),
          );
        }),
      ),
    );
  }
}
