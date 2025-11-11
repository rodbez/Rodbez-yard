import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/vertical_stepper/vertical_stepper.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../controller/driver_details_controller.dart';

class DriverRides extends StatelessWidget {
  final int driverId;

  const DriverRides({super.key, required this.driverId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverDetailsController(driverId));

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: RSizes.smallSpace,
              vertical: RSizes.sm,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  color: RColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(RSizes.borderRadiusLg)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Row
                    Padding(
                      padding: const EdgeInsets.all(RSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Ride Info
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "One way",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: RSizes.sm),
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.grey,
                                    ),
                                    const SizedBox(width: RSizes.xs),
                                    Flexible(
                                      child: Text(
                                        "Sedan",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: RSizes.xs),
                                Text(
                                  "18/11/2025, 10:24AM",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: RSizes.xs),
                                Chip(
                                  backgroundColor: RColors.successStatus,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusLg,
                                    ),
                                    side: BorderSide(color: RColors.successStatus),
                                  ),
                                  label: Text(
                                    "Completed",
                                    style: Theme.of(context).textTheme.labelSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: RColors.white,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: RSizes.spaceBtwItems,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                              ],
                            ),
                          ),
      
                          /// Fare
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ 1999",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                      child: VerticalStepper(
                        steps: [
                          VerticalStepperItem(
                            from: "Pick",
                            title: "Danapur Patna",
                            imagePath: RImages.currentLocation,
                            backgroundColor: Colors.white,
                          ),
                          VerticalStepperItem(
                            from: "Drop",
                            title: "Saharsa",
                            imagePath: RImages.location,
                          ),
                        ],
                      ),
                    ),
      
                    Container(
                      decoration: BoxDecoration(
                        color: RColors.svgBackground,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(RSizes.borderRadiusLg),
                          bottomLeft: Radius.circular(RSizes.borderRadiusLg),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_half_rounded,color: RColors.yellow),
                            const SizedBox(width: RSizes.sm),
                            Text('(4.2)'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: RSizes.smallSpace,
              vertical: RSizes.sm,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: RColors.white,
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(RSizes.borderRadiusLg),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Row
                    Padding(
                      padding: const EdgeInsets.all(RSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Ride Info
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "One way",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: RSizes.sm),
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.grey,
                                    ),
                                    const SizedBox(width: RSizes.xs),
                                    Flexible(
                                      child: Text(
                                        "Sedan",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: RSizes.xs),
                                Text(
                                  "18/11/2025, 10:24AM",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: RSizes.xs),
                                Chip(
                                  backgroundColor: RColors.successStatus,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusLg,
                                    ),
                                    side: BorderSide(color: RColors.successStatus),
                                  ),
                                  label: Text(
                                    "Completed",
                                    style: Theme.of(context).textTheme.labelSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: RColors.white,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: RSizes.spaceBtwItems,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                              ],
                            ),
                          ),
      
                          /// Fare
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ 1999",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
      
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                      child: VerticalStepper(
                        steps: [
                          VerticalStepperItem(
                            from: "Pick",
                            title: "Danapur Patna",
                            imagePath: RImages.currentLocation,
                            backgroundColor: Colors.white,
                          ),
                          VerticalStepperItem(
                            from: "Drop",
                            title: "Saharsa",
                            imagePath: RImages.location,
                          ),
                        ],
                      ),
                    ),
      
                    Container(
                      decoration: BoxDecoration(
                        color: RColors.svgBackground,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(RSizes.borderRadiusLg),
                          bottomLeft: Radius.circular(RSizes.borderRadiusLg),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_half_rounded,color: RColors.yellow),
                            const SizedBox(width: RSizes.sm),
                            Text('(4.2)'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: RSizes.smallSpace,
              vertical: RSizes.sm,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  color: RColors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(RSizes.borderRadiusLg)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Row
                    Padding(
                      padding: const EdgeInsets.all(RSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Ride Info
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "One way",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: RSizes.sm),
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.grey,
                                    ),
                                    const SizedBox(width: RSizes.xs),
                                    Flexible(
                                      child: Text(
                                        "Sedan",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: RSizes.xs),
                                Text(
                                  "18/11/2025, 10:24AM",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: RSizes.xs),
                                Chip(
                                  backgroundColor: RColors.successStatus,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusLg,
                                    ),
                                    side: BorderSide(color: RColors.successStatus),
                                  ),
                                  label: Text(
                                    "Completed",
                                    style: Theme.of(context).textTheme.labelSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: RColors.white,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: RSizes.spaceBtwItems,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                              ],
                            ),
                          ),

                          /// Fare
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ 1999",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                      child: VerticalStepper(
                        steps: [
                          VerticalStepperItem(
                            from: "Pick",
                            title: "Danapur Patna",
                            imagePath: RImages.currentLocation,
                            backgroundColor: Colors.white,
                          ),
                          VerticalStepperItem(
                            from: "Drop",
                            title: "Saharsa",
                            imagePath: RImages.location,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: RColors.svgBackground,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(RSizes.borderRadiusLg),
                          bottomLeft: Radius.circular(RSizes.borderRadiusLg),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_half_rounded,color: RColors.yellow),
                            const SizedBox(width: RSizes.sm),
                            Text('(4.2)'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: RSizes.smallSpace,
              vertical: RSizes.sm,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: RColors.white,
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(RSizes.borderRadiusLg),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Row
                    Padding(
                      padding: const EdgeInsets.all(RSizes.sm),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Ride Info
                          Flexible(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Text(
                                        "One way",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(width: RSizes.sm),
                                    const CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.grey,
                                    ),
                                    const SizedBox(width: RSizes.xs),
                                    Flexible(
                                      child: Text(
                                        "Sedan",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.titleSmall
                                            ?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: RSizes.xs),
                                Text(
                                  "18/11/2025, 10:24AM",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(height: RSizes.xs),
                                Chip(
                                  backgroundColor: RColors.successStatus,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusLg,
                                    ),
                                    side: BorderSide(color: RColors.successStatus),
                                  ),
                                  label: Text(
                                    "Completed",
                                    style: Theme.of(context).textTheme.labelSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: RColors.white,
                                      letterSpacing: -0.7,
                                    ),
                                  ),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: RSizes.spaceBtwItems,
                                  ),
                                  padding: EdgeInsets.zero,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                              ],
                            ),
                          ),

                          /// Fare
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ 1999",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: RSizes.sm),
                      child: VerticalStepper(
                        steps: [
                          VerticalStepperItem(
                            from: "Pick",
                            title: "Danapur Patna",
                            imagePath: RImages.currentLocation,
                            backgroundColor: Colors.white,
                          ),
                          VerticalStepperItem(
                            from: "Drop",
                            title: "Saharsa",
                            imagePath: RImages.location,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: RColors.svgBackground,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(RSizes.borderRadiusLg),
                          bottomLeft: Radius.circular(RSizes.borderRadiusLg),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_rounded,color: RColors.yellow),
                            Icon(Icons.star_half_rounded,color: RColors.yellow),
                            const SizedBox(width: RSizes.sm),
                            Text('(4.2)'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
