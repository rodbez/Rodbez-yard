import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CabListCard extends StatelessWidget {
  final String cabNumber;
  final String? vehicleType;
  final String? vehicleStatus;
  final String? driverName;
  final String? updatedAt;
  final VoidCallback? onTapChangeDriver;
  final VoidCallback? onTapViewMap;
  final VoidCallback? onTap;

  const CabListCard({
    super.key,
    required this.cabNumber,
    this.vehicleType,
    this.vehicleStatus,
    this.driverName,
    this.updatedAt,
    this.onTapChangeDriver,
    this.onTapViewMap,
    this.onTap,
  });

  Color _getStatusColor() {
    if ((vehicleStatus ?? '').toLowerCase() == 'exited') return RColors.error;
    if ((vehicleStatus ?? '').toLowerCase() == 'inside') return RColors.successStatus;
    return RColors.darkerGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: RSizes.sm),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(RSizes.sm),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// 🔹 Top Row: Car Image + Number + Change Driver + Map
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 25,
                    backgroundImage: AssetImage(RImages.profileImage),
                  ),
                  const SizedBox(width: RSizes.xSm),

                  /// Expanded ensures full responsive layout
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Car Number
                        Text(
                          cabNumber,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: InkWell(
                                onTap: onTapChangeDriver,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.edit,
                                      color: RColors.error,
                                      size: 14,
                                    ),
                                    const SizedBox(width: 4),
                                    Flexible(
                                      child: Text(
                                        "Change Driver",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: RColors.error,
                                              decoration: TextDecoration.underline,
                                              decorationColor: RColors.error,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: RSizes.sm),

                            /// 🔸 View on Map Button (Right Side)
                            Flexible(
                              flex: 4,
                              child: InkWell(
                                onTap: onTapViewMap,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: RColors.white,
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusSm,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.15,
                                        ),
                                        blurRadius: 6,
                                        offset: const Offset(1, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 15,
                                      ),
                                      const SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          "View On Map",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                color: RColors.darkerGrey,
                                              ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: RSizes.xSm),

              /// 🔹 Second Row: Type + Status + Arrow
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Info Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Type & Status
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Type: ",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: RColors.darkerGrey),
                              ),
                              TextSpan(
                                text: vehicleType,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(text: " | "),
                              TextSpan(
                                text: "Status: ",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: RColors.darkerGrey),
                              ),
                              TextSpan(
                                text: vehicleStatus,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _getStatusColor(),
                                    ),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: RSizes.xxSm),

                        /// Driver name and updated time
                        Row(
                          children: [
                            Image.asset(
                              RImages.carHandleIcon,
                              height: 16,
                              width: 16,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                "${driverName ?? 'Unknown'} | Updated: ${updatedAt ?? '--:--'}",
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: RColors.darkerGrey),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: RSizes.xxSm),
                  const Icon(Icons.navigate_next),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
