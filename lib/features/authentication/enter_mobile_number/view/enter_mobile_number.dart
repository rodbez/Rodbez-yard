import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodbez_yard/features/authentication/enter_mobile_number/controller/mobile_number_controller.dart';
import 'package:rodbez_yard/features/authentication/enter_mobile_number/view/widgets/mobile_number_footer.dart';
import 'package:rodbez_yard/features/authentication/enter_mobile_number/view/widgets/mobile_number_form.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/device/device_utility.dart';

class EnterMobileNumber extends StatefulWidget {
  final Country? preSelectedCountry;
  final String? preFilledPhone;

  const EnterMobileNumber({
    super.key,
    this.preSelectedCountry,
    this.preFilledPhone,
  });

  @override
  State<EnterMobileNumber> createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  final controller = Get.put(MobileNumberController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.preSelectedCountry != null) {
        controller.selectedCountry.value = widget.preSelectedCountry!;
      }
      if (widget.preFilledPhone != null) {
        controller.phoneController.text = widget.preFilledPhone!;
      }
      controller.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: controller.unfocus,
          behavior: HitTestBehavior.translucent,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Padding(
                  padding: EdgeInsets.all(RSizes.md),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        RTexts.phoneNumberTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: RSizes.xxSm),
                      Text(
                        RTexts.phoneNumberSubTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: RColors.textDarkGrey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: RSizes.spaceBtwItems),
                      MobileNumberInputForm(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: MobileNumberFooterBtn()),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);

    // Create a smooth wave using two quadratic curves
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height - 30,
    );
    path.quadraticBezierTo(
      3 * size.width / 4,
      size.height - 60,
      size.width,
      size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
