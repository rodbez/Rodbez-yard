import 'package:flutter/material.dart';
import 'package:rodbez_yard/common/widgets/ride_card/ride_card.dart';
import 'package:rodbez_yard/features/personalization/cab_details/controller/cab_details_controller.dart';
import 'package:rodbez_yard/features/personalization/cab_details/view/widgets/cab_slider_image.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class CabDetails extends StatelessWidget {
  const CabDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CabDetailsController());
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              CarDetailsCarousel(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: RSizes.smallSpace,
                  vertical: RSizes.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left text
                    Flexible(
                      child: Text(
                        "Driver Name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: RColors.darkerGrey,
                        ),
                      ),
                    ),

                    const SizedBox(width: RSizes.xSm),

                    // Right text
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Today",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: RColors.darkerGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: RSizes.smallSpace,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left text (Driver name)
                    Flexible(
                      child: Text(
                        "Abhishek Singh",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(width: RSizes.xSm),

                    // Right text (Distance)
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "340 Km",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RideCard(
                rideType: 'One way',
                cabType: 'Sedan',
                totalAmount: '1999',
                dateTime: '18/11/2025',
                rideStatus: 'Completed',
                pickupLocation: 'Danapur Junction',
                dropLocation: 'Saharsa',
                rating: 4.6,
              ),
              RideCard(
                rideType: 'One way',
                cabType: 'Sedan',
                totalAmount: '1999',
                dateTime: '18/11/2025',
                rideStatus: 'Completed',
                pickupLocation: 'Danapur Junction',
                dropLocation: 'Saharsa',
                rating: 2.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
