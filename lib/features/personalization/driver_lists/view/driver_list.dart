import 'package:flutter/material.dart';
import 'package:rodbez_yard/common/widgets/custom_snackbar/custom_snackbar.dart';
import 'package:rodbez_yard/features/personalization/driver_details/view/driver_details.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import 'package:get/get.dart';

class DriverList extends StatelessWidget {
  const DriverList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Driver Lists",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(RSizes.smallSpace),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Get.to(()=> DriverDetails());
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: RSizes.sm),
                child: Container(
                  padding: EdgeInsets.all(RSizes.smallSpace),
                  decoration: BoxDecoration(
                    color: RColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(RSizes.borderRadiusLg),
                    ),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 20,
                        backgroundImage: AssetImage(RImages.profileImage),
                      ),
                      const SizedBox(width: RSizes.xSm),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 4,
                                  child: Text(
                                    "Abhishek Singh",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: RSizes.xxSm),
                                Flexible(
                                  flex: 2,
                                  child: InkWell(
                                    onTap: () {
                                      SnackBarUtil.show(
                                        message: "We're working here",
                                        isError: false,
                                      );
                                    },
                                    child: Text(
                                      "+Add Driver",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: RColors.textBlueUrlColor,
                                            decoration: TextDecoration.underline,
                                            decorationColor:
                                                RColors.textBlueUrlColor,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Icon(Icons.phone, size: 15),
                                ),
                                const SizedBox(width: RSizes.xxSm),
                                Flexible(
                                  flex: 4,
                                  child: Text(
                                    "1234567890",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(()=> DriverDetails());
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: RSizes.sm),
                child: Container(
                  padding: EdgeInsets.all(RSizes.smallSpace),
                  decoration: BoxDecoration(
                    color: RColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 8,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(RSizes.borderRadiusLg),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Profile Image
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 20,
                        backgroundImage: AssetImage(RImages.profileImage),
                      ),

                      const SizedBox(width: RSizes.xSm),

                      /// Main Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Name + Change Driver
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Abhishek Singh",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: Theme.of(context).textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: RSizes.xxSm),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      SnackBarUtil.show(
                                        message: "We're working here",
                                        isError: false,
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.edit,
                                          color: RColors.error,
                                          size: 15,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Change Driver',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(color: RColors.error),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: RSizes.xxSm),

                            /// Phone + Car Info
                            Row(
                              children: [
                                /// Phone
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.phone, size: 15),
                                      const SizedBox(width: RSizes.xxSm),
                                      Expanded(
                                        child: Text(
                                          "9876543210",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                /// Car Info
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.directions_car, size: 15),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          "Sedan BR01AB1234",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: RColors.textDarkGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
