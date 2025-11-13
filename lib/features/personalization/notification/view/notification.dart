import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/notification/view/widgets/notification_card.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notification",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: RSizes.smallSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NotificationCard(
                vehicleNumber: "BR 04AF 8944",
                driverName: "Abhishek Raj",
                status: "Arriving",
                time: "2hr",
                onTap: () {},
              ),
              NotificationCard(
                vehicleNumber: "BR 04AF 8944",
                driverName: "Abhishek Raj",
                status: "Leaving",
                time: "2hr",
                onTap: () {},
              ),
              NotificationCard(
                vehicleNumber: "BR 04AF 8944",
                driverName: "Abhishek Raj",
                status: "Arriving",
                time: "2hr",
                onTap: () {},
              ),
              NotificationCard(
                vehicleNumber: "BR 04AF 8944",
                driverName: "Abhishek Raj",
                status: "Leaving",
                time: "2hr",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
