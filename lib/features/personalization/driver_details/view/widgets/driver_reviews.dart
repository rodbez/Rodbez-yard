import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/driver_details/view/widgets/review_tile_widgets.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';

class DriverReviews extends StatelessWidget {
  final int driverId;
  const DriverReviews({super.key, required this.driverId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),

          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
          ReviewTileWidget(
            username: "Devon Lane",
            date: "18/11/2025",
            location: "Saharsa, Bihar",
            review: "Excellent service! The driver was polite, and the car was clean and comfortable. Will definitely use again.",
            rating: 3.2,
            profileImagePath: RImages.profileImage,
            isNetworkImage: false,
          ),
        ],
      ),
    );
  }
}