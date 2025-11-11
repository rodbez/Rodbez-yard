import 'package:flutter/material.dart';
import '../../../../utils/constants/image_strings.dart';
import '../controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Image.asset(RImages.splashScreenImage, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
