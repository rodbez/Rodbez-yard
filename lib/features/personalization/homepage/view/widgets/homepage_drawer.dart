import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/cab_lists/view/cab_lists.dart';
import 'package:rodbez_yard/features/personalization/help_support/view/help_support.dart';
import 'package:rodbez_yard/features/personalization/leaderboard/view/leaderboard.dart';
import 'package:rodbez_yard/features/personalization/notification/view/notification.dart';
import 'package:rodbez_yard/features/personalization/profile/view/profile.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../driver_lists/view/driver_list.dart';
import 'drawer/drawer_tile.dart';
import 'package:get/get.dart';

class HomepageDrawer extends StatelessWidget {
  const HomepageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: RColors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(RImages.drawerHeader),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(RSizes.smallSpace),
            child: Container(
              padding: const EdgeInsets.only(
                left: RSizes.sm,
                right: RSizes.sm,
                top: RSizes.sm,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(width: 1, color: RColors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(RSizes.borderRadiusLg),
                ),
                color: RColors.white,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () =>Get.to(() => Profile()),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: RColors.white,
                          maxRadius: 25,
                          backgroundImage: AssetImage(RImages.profileImage),
                        ),
                        const SizedBox(width: RSizes.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dilkhush Kumar",
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                              ),
                              Text(
                                "+91-XXX XXX XXXX",
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: RColors.textDarkGrey,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  DrawerTile(
                    icon: Icons.star,
                    title: "Ratings",
                    onTap: () => Get.to(() => Profile()),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: RSizes.smallSpace,
              right: RSizes.smallSpace,
              top: RSizes.xxSm,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: RSizes.sm,
                right: RSizes.sm,
                top: RSizes.sm,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(width: 1, color: RColors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(RSizes.borderRadiusLg),
                ),
                color: RColors.white,
              ),
              child: Column(
                children: [
                  DrawerTile(
                    icon: Icons.local_taxi_rounded,
                    title: "Current Vehicles",
                    onTap: () => Get.to(() => CabLists()),
                  ),
                  Divider(),
                  DrawerTile(
                    icon: Icons.leaderboard_rounded,
                    title: "Leaderboard",
                    onTap: () => Get.to(() => Leaderboard()),
                  ),
                  Divider(),
                  DrawerTile(
                    icon: Icons.group_rounded,
                    title: "Manage Drivers",
                    onTap: () => Get.to(() => DriverList()),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(RSizes.smallSpace),
            child: Container(
              padding: const EdgeInsets.only(
                left: RSizes.sm,
                right: RSizes.sm,
                top: RSizes.sm,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(width: 1, color: RColors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(RSizes.borderRadiusLg),
                ),
                color: RColors.white,
              ),
              child: Column(
                children: [
                  DrawerTile(
                    icon: Icons.notifications_rounded,
                    title: "Notifications",
                    onTap: () => Get.to(NotificationScreen()),
                  ),
                  Divider(),
                  DrawerTile(
                    icon: Icons.help_outline_rounded,
                    title: "Help",
                    onTap: () => Get.to(HelpSupport()),
                  ),
                  Divider(),
                  DrawerTile(
                    icon: Icons.settings_rounded,
                    title: "Settings",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: RSizes.smallSpace,
              right: RSizes.smallSpace,
              top: RSizes.xxSm,
              bottom: RSizes.smallSpace
            ),
            child: Container(
              padding: const EdgeInsets.only(
                left: RSizes.sm,
                right: RSizes.sm,
                top: RSizes.sm,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(width: 1, color: RColors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(RSizes.borderRadiusLg),
                ),
                color: RColors.white,
              ),
              child: Column(
                children: [
                  DrawerTile(
                    icon: Icons.logout_rounded,
                    title: "Logout",
                    iconColor: RColors.error,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
