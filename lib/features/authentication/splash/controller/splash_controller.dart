import 'package:get/get.dart';
import 'package:rodbez_yard/features/authentication/enter_mobile_number/view/enter_mobile_number.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 4), () async {
      Get.offAll(() => EnterMobileNumber());
    });
  }
}
