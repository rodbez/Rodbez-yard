// import 'dart:async';
// import 'dart:ui';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// import '../../utils/constants/colors.dart';
// import '../../utils/constants/image_strings.dart';
// import '../../utils/constants/sizes.dart';
//
// class LocationService extends GetxService {
//   bool _dialogShown = false;
//   bool isTimerRunning = false;
//   late Timer _timer;
//
//   Future<LocationService> init() async {
//     _startLocationMonitoring();
//     return this;
//   }
//
//   void _startLocationMonitoring() {
//     if(!isTimerRunning) {
//
//       _timer = Timer.periodic(Duration(seconds: 5), (timer) {
//         checkLocationEnabled();
//       });
//       isTimerRunning = true;
//     }
//
//   }
//
//   Future<void> checkLocationEnabled() async {
//     bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isLocationEnabled && !_dialogShown) {
//       _dialogShown = true;
//       showLocationAlert();
//     } else if (isLocationEnabled) {
//       _dialogShown = false;
//     }
//   }
//
//   void showLocationAlert() {
//     if (Get.isDialogOpen != true) {
//       Get.dialog(
//         Stack(
//           children: [
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Container(color: Colors.black.withValues(alpha: 0.3)),
//             ),
//             Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     maxWidth: 400, // 📱 Max width for large screens
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: RColors.white,
//                       borderRadius: BorderRadius.circular(RSizes.borderRadiusLg),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 12,
//                           offset: Offset(0, 6),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(RSizes.defaultSpace),
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 RImages.locationAlertIcon,
//                                 height: 100,
//                                 fit: BoxFit.contain,
//                               ),
//                               const SizedBox(height: RSizes.spaceBtwItems),
//                               const Text(
//                                 "Location Disabled",
//                                 style: TextStyle(
//                                   fontFamily: 'Nunito',
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: RColors.black,
//                                   decoration: TextDecoration.none,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               const SizedBox(height: RSizes.xSmallSpace),
//                               const Text(
//                                 'Please enable location services to continue using the app.',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: 'Nunito',
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.normal,
//                                   color: Color(0xFF666666),
//                                   decoration: TextDecoration.none,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: const Color(0xFF8ED023).withValues(alpha: 0.1),
//                               border: Border.all(color: Color(0xFF8ED023))
//                           ),
//                           child: TextButton(
//                             onPressed: () async {
//                               Get.back();
//                               _dialogShown = false;
//                               await Geolocator.openLocationSettings();
//                             },
//                             child: const Text(
//                               'Enable device location',
//                               style: TextStyle(
//                                 color: RColors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                                 decoration: TextDecoration.none,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           child: TextButton(
//                             onPressed: () {
//                               Get.back();
//                               _dialogShown = false;
//                             },
//                             style: ButtonStyle(
//                                 overlayColor: MaterialStateProperty.all(RColors.white)
//                             ),
//                             child: const Text(
//                               "Not Now",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Color(0xFF666666),
//                                 decoration: TextDecoration.none,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         barrierDismissible: false,
//       );
//     }
//   }
//
//
//   @override
//   void onClose() {
//     _timer.cancel();
//     super.onClose();
//   }
// }


import 'dart:async';
import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class LocationService extends GetxService {
  bool _dialogShown = false;
  bool isTimerRunning = false;
  late Timer _timer;

  Future<LocationService> init() async {
    _startLocationMonitoring();
    return this;
  }

  void _startLocationMonitoring() {
    if (!isTimerRunning) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        checkLocationEnabled();
      });
      isTimerRunning = true;
    }
  }

  Future<void> checkLocationEnabled() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled && !_dialogShown) {
      _dialogShown = true;
      showLocationAlert();
    } else if (isLocationEnabled) {
      _dialogShown = false;
    }
  }

  void showLocationAlert() {
    if (Get.isDialogOpen != true) {
      final bool isDark = Get.isDarkMode;

      final Color backgroundColor = isDark ? const Color(0xFF1E1E1E) : RColors.white;
      final Color textColor = isDark ? RColors.white : RColors.black;
      final Color secondaryTextColor = isDark ? Colors.grey.shade300 : const Color(0xFF666666);
      final Color borderColor = const Color(0xFF8ED023);
      final Color buttonBgColor = isDark
          ? const Color(0xFF8ED023).withValues(alpha: 0.2)
          : const Color(0xFF8ED023).withValues(alpha: 0.1);

      Get.dialog(
        Stack(
          children: [
            // 🔹 Dimmed blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ),

            // 🔹 Dialog body
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(RSizes.borderRadiusLg),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(RSizes.defaultSpace),
                          child: Column(
                            children: [
                              Image.asset(
                                RImages.locationAlertIcon,
                                height: 100,
                                fit: BoxFit.contain,
                                color: isDark ? Colors.white70 : null,
                              ),
                              const SizedBox(height: RSizes.spaceBtwItems),
                              Text(
                                "Location Disabled",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                  decoration: TextDecoration.none,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: RSizes.xSmallSpace),
                              Text(
                                'Please enable location services to continue using the app.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: secondaryTextColor,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // ✅ "Enable Location" button
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: buttonBgColor,
                            border: Border.all(color: borderColor),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(RSizes.borderRadiusLg),
                              bottomRight: Radius.circular(RSizes.borderRadiusLg),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              Get.back();
                              _dialogShown = false;
                              await Geolocator.openLocationSettings();
                            },
                            child: Text(
                              'Enable Device Location',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),

                        // ✅ "Not Now" button
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Get.back();
                              _dialogShown = false;
                            },
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text(
                              "Not Now",
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryTextColor,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
