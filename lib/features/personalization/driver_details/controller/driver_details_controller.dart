import 'package:get/get.dart';

class DriverDetailsController extends GetxController {
  static DriverDetailsController get instance => Get.find();
  final int driverId;

  DriverDetailsController(this.driverId);

  @override
  void onInit() {
    super.onInit();
    fetchDriverDetails();
  }

  Future<void> fetchDriverDetails() async {}
}
