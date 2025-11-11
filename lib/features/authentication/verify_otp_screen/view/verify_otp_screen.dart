import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/device/device_utility.dart';
import '../../enter_mobile_number/controller/mobile_number_controller.dart';
import '../../enter_mobile_number/view/enter_mobile_number.dart';
import '../controller/verify_otp_controller.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const VerifyOtpScreen({super.key, required this.phoneNumber});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late final VerifyOtpController controller;
  late final String tag;

  @override
  void initState() {
    super.initState();
    tag = widget.phoneNumber;
    controller = Get.put(
      VerifyOtpController(phoneNumber: widget.phoneNumber),
      tag: tag,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mobileController = MobileNumberController.instance;
    final controller = Get.find<VerifyOtpController>(tag: tag);

    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(RSizes.defaultSpace),
          child: Obx(() {
            if (controller.isLoading.value) {
              return otpShimmerPlaceholder(context);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipper(),
                      child: Container(
                        height: RDeviceUtils.getScreenHeight() * .25,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFFD700), Color(0xFFFFB300)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        RImages.mobileNumberHeader,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: RColors.black,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),

                        child: ClipOval(
                          child: Image.asset(
                            RImages.splashScreen,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(RSizes.defaultSpace),child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(RTexts.verifyOtpTitle, style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    Text(
                      RTexts.verifyOtpSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: RColors.darkerGrey),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.phoneNumber,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' through SMS',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: RColors.darkerGrey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    GestureDetector(
                      onTap: () {
                        Get.delete<VerifyOtpController>(tag: tag);
                        Get.to(() => EnterMobileNumber(
                          preSelectedCountry:
                          mobileController.selectedCountry.value,
                          preFilledPhone: mobileController.phoneController.text,
                        ),
                        );
                      },
                      child: Text(
                        'Edit your phone number?',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: RColors.textBlueUrlColor,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    Obx(
                          () => Pinput(
                        length: 6,
                        controller: controller.pinController,
                        focusNode: controller.focusNode,
                        defaultPinTheme: controller.defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        validator: (value) => value!.length == 6 ? null : 'Invalid OTP',
                        onCompleted: (pin) => controller.verifyOtp(pin),
                        onChanged: (value) {},
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: RColors.focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: controller.defaultPinTheme.copyWith(
                          decoration: controller.defaultPinTheme.decoration!
                              .copyWith(
                            color: RColors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: RColors.focusedBorderColor,
                            ),
                          ),
                        ),
                        submittedPinTheme: controller.defaultPinTheme.copyWith(
                          decoration: controller.defaultPinTheme.decoration!
                              .copyWith(
                            color: RColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                              controller.isPinValid.value
                                  ? RColors.success
                                  : RColors.focusedBorderColor,
                            ),
                          ),
                        ),
                        errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                          border: Border.all(color: RColors.error),
                        ),
                      ),
                    ),
                  ],
                ),)
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(
              left: RSizes.smallSpace,
              right: RSizes.smallSpace,
              bottom:
              MediaQuery.of(context).viewInsets.bottom + RSizes.smallSpace,
              top: RSizes.smallSpace,
            ),
            child: Obx((){
              if (controller.isLoading.value) {
                return otpBottomShimmer(context);
              }
              return Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "Haven't got the confirmation code yet? ",
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: RColors.darkerGrey),
                  ),
                  Obx(() {
                    return controller.isTimerActive.value
                        ? Text(
                      controller.formattedTime,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: RColors.textBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        : const SizedBox.shrink();
                  }),
                  Obx(() {
                    return controller.isResendEnabled.value
                        ? GestureDetector(
                      onTap: controller.resendOtp,
                      child: Text(
                        "Resend",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: RColors.textBlack,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                        : const SizedBox.shrink();
                  }),
                ],
              );
            })
        ),
      ),
    );
  }

  Widget otpBottomShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Container(
            height: 14,
            width: 220,
            color: Colors.white,
          ),
          Container(
            height: 14,
            width: 40,
            color: Colors.white,
          ),
          Container(
            height: 14,
            width: 60,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget otpShimmerPlaceholder(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 180,color: Colors.white,),
          const SizedBox(height: 16),
          Container(height: 20, width: 200, color: Colors.white), // Title
          const SizedBox(height: 16),
          Container(height: 16, width: double.infinity, color: Colors.white), // Subtitle
          const SizedBox(height: 8),
          Container(height: 16, width: 150, color: Colors.white), // Phone number
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) =>
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 50,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
