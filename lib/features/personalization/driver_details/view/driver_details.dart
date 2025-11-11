import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rodbez_yard/features/personalization/driver_details/view/widgets/driver_reviews.dart';
import 'package:rodbez_yard/features/personalization/driver_details/view/widgets/driver_rides.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class DriverDetails extends StatelessWidget {
  const DriverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.white,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) =>
            [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.asset(
                                      RImages.profileBackgroundImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          onPressed: () => Get.back(),
                                          icon: const Icon(
                                            CupertinoIcons.multiply,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Driver Profile",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .titleMedium
                                                ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -50),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  _iconBox(
                                    context,
                                    Icons.call,
                                    "Call",
                                    onTap: () async {
                                      // final driverNo = driver?.mobileNo ?? '';
                                      // final Uri phoneUri = Uri(scheme: 'tel', path: '+91${driverNo.trim()}');
                                      // if (await canLaunchUrl(phoneUri)) {
                                      //   await launchUrl(phoneUri);
                                      // } else {
                                      //   SnackBarUtil.show(message: 'Something went wrong', isError: true);
                                      // }
                                    },
                                  ),
                                  Container(
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        0.28,
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width *
                                        0.28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        RSizes.borderRadiusLg,
                                      ),
                                      border: Border.all(
                                        color: RColors.yellow,
                                        width: 2,
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(RImages.profileImage),
                                      ),
                                      // image: DecorationImage(
                                      //   image: image != null
                                      //       ? NetworkImage(ApiConstant.imagePathUrl + image)
                                      //       : AssetImage(RImages.profileImage) as ImageProvider,
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                  _iconBox(
                                    context,
                                    null,
                                    "WhatsApp",
                                    isSvg: true,
                                    onTap: () async {
                                      // final rawNumber = driver?.whatsapp ?? '';
                                      // final digitsOnly = rawNumber.replaceAll(RegExp(r'[^\d]'), '');
                                      // final whatsappNo = digitsOnly.startsWith('91') ? digitsOnly : '91$digitsOnly';
                                      //
                                      // final text = Uri.encodeComponent('Hi, I’m contacting you via Rodbez');
                                      // final whatsappUri = Uri.parse("https://wa.me/$whatsappNo?text=$text");
                                      //
                                      // if (await canLaunchUrl(whatsappUri)) {
                                      //   await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
                                      // } else {
                                      //   SnackBarUtil.show(message: "Could not launch WhatsApp. Is it installed?", isError: true);
                                      // }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 295,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              "Mintu Kumar",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            "BR 04AF 1234",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: RColors.textGrey),
                          ),
                        ),
                        const SizedBox(width: RSizes.xs),
                        Icon(Icons.directions_car, size: 17),
                        const SizedBox(width: RSizes.xs),
                        Flexible(
                          child: Text(
                            "Sedan",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: RColors.textGrey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: RSizes.sm),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: RSizes.sm, vertical: 2),
                      decoration: BoxDecoration(
                        color: RColors.textBlack,
                        borderRadius: BorderRadius.all(
                          Radius.circular(RSizes.borderRadiusLg),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "2.3",
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                              color: RColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.star_rate_rounded, color: RColors.yellow,
                            size: 16,),
                          Icon(Icons.star_rate_rounded, color: RColors.yellow,
                            size: 16,),
                          Icon(Icons.star_half_rounded, color: RColors.yellow,
                            size: 16,),
                        ],
                      ),
                    ),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    Container(
                      width: RDeviceUtils.getScreenWidth(context) * .75,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xFFFFFBE6),
                        border: Border.all(color: const Color(0xFFEDAE10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(RSizes.xs),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: const Color(0xFFEDAE10),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          labelColor: RColors.white,
                          unselectedLabelColor: RColors.textDarkGrey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Nunito",
                          ),
                          tabs: const [
                            Tab(text: "Rides"),
                            Tab(text: "Reviews"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: TabBarView(
              children: [DriverRides(driverId: 2),
                DriverReviews(driverId: 2)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconBox(BuildContext context,
      IconData? icon,
      String label, {
        bool isSvg = false,
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.2,
        padding: const EdgeInsets.all(RSizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RSizes.borderRadiusLg),
          color: RColors.lightGrey,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSvg
                ? SvgPicture.asset(RImages.whatsAppBlackIcon)
                : Icon(icon, size: 20),
            const SizedBox(height: RSizes.xs),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: Theme
                  .of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(
                color: RColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
