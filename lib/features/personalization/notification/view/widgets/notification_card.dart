import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class NotificationCard extends StatelessWidget {
  final String vehicleNumber;
  final String driverName;
  final String status;
  final String time;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.vehicleNumber,
    required this.driverName,
    required this.status,
    required this.time,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'arriving':
        return RColors.successStatus;
      case 'leaving':
        return RColors.errorStatus;
      default:
        return Colors.grey;
    }
  }

  String _getStatusImage() {
    switch (status.toLowerCase()) {
      case 'arriving':
        return RImages.cabArrived;
      case 'leaving':
        return RImages.cabLeave;
      default:
        return RImages.cabArrived;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: RSizes.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RSizes.borderRadiusLg),
                color: RColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(RSizes.smallSpace),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.directions_car,
                                color: Colors.black87,
                              ),
                              const SizedBox(width: RSizes.xxSm),

                              // ✅ Use Flexible instead of Expanded here to give natural width
                              Flexible(
                                fit: FlexFit.tight,
                                child: Text(
                                  vehicleNumber,
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 1,
                                ),
                              ),

                              const SizedBox(width: RSizes.xxSm),

                              // ✅ Wrap status container in IntrinsicWidth + FittedBox
                              // so it takes only as much space as needed
                              IntrinsicWidth(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: RSizes.xxSm,
                                    horizontal: RSizes.xSm,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      RSizes.borderRadiusLg,
                                    ),
                                    color: _getStatusColor(),
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      status,
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: RColors.white),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: RSizes.xSm),
                          Row(
                            children: [
                              Image.asset(
                                RImages.carHandleIcon,
                                fit: BoxFit.contain,
                                width: 20,
                              ),
                              const SizedBox(width: RSizes.xxSm),
                              Expanded(
                                child: Text(
                                  driverName,
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: RColors.darkGrey,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: RSizes.xSm),
                    Flexible(
                      flex: 0,
                      child: Image.asset(
                        _getStatusImage(),
                        fit: BoxFit.contain,
                        width: 60, // adaptive image size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: RSizes.xSm),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 30,
                child: Text(
                  time,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: RColors.darkGrey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              InkWell(onTap: onTap, child: const Icon(Icons.more_horiz)),
            ],
          ),
        ],
      ),
    );
  }
}
