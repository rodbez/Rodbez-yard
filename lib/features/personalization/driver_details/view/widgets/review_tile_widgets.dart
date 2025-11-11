import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ReviewTileWidget extends StatelessWidget {
  final String username;
  final String date;
  final String location;
  final String review;
  final double rating;
  final String profileImagePath;
  final bool isNetworkImage;

  const ReviewTileWidget({
    super.key,
    required this.username,
    required this.date,
    required this.location,
    required this.review,
    required this.rating,
    required this.profileImagePath,
    this.isNetworkImage = false,
  });

  List<Widget> buildStarIcons(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.25 && (rating - fullStars) <= 0.75;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: RColors.yellow, size: 18));
    }
    if (hasHalfStar) {
      stars.add(const Icon(Icons.star_half, color: RColors.yellow, size: 18));
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(const Icon(Icons.star_border, color: RColors.yellow, size: 18));
    }

    return stars;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: RSizes.smallSpace,
        vertical: RSizes.sm,
      ),
      child: Container(
        padding: const EdgeInsets.all(RSizes.xSmallSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RSizes.borderRadiusLg),
          border: Border.all(width: 1, color: RColors.grey),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// LEFT SIDE
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Username
                  Text(
                    username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: RSizes.xs),

                  /// Date & Location
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          date,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(width: RSizes.xs),
                      Flexible(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: RSizes.xs),

                  /// Stars and Source
                  Row(
                    children: [
                      ...buildStarIcons(rating),
                      const SizedBox(width: RSizes.sm),
                      Flexible(
                        child: Chip(
                          backgroundColor: RColors.grey,
                          label: Text(
                            "Google",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: RColors.darkGrey,
                              letterSpacing: -0.5,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          labelPadding:
                          const EdgeInsets.symmetric(horizontal: RSizes.sm),
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),

                  /// Review Text
                  Text(
                    review,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),

            /// Profile Image
            CircleAvatar(
              radius: 25,
              // backgroundColor: RColors.yellow,
              child: ClipOval(
                child: isNetworkImage
                    ? Image.network(
                  profileImagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  profileImagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
