import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/driver_lists/view/driver_list.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: RColors.darkYellow,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Profile",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 70,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                              image: AssetImage(RImages.profileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: RSizes.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kumar, Abhi",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "+91 12345 67890",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: RSizes.smallSpace),

              Row(
                children: [
                  _buildTopCard("Yard Name", "PatnaBR12"),
                  const SizedBox(width: RSizes.xSm),
                  _buildTopCard("Total Cabs", "24 Cars"),
                  const SizedBox(width: RSizes.xSm),
                  _buildTopCard("Total Drivers", "12 Driver"),
                ],
              ),

              const SizedBox(height: RSizes.smallSpace),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.local_taxi_rounded,
                      text: "Current Vehicles",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.history_rounded,
                      text: "Vehicle History",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                        icon: Icons.group_rounded,
                        text: "Manage Drivers",
                        onTap: () {
                          Get.to(() => DriverList());
                        }
                    ),
                    _buildMenuItem(
                      icon: Icons.notifications_rounded,
                      text: "Notifications",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.help_outline_rounded,
                      text: "Help & Support",
                      onTap: () {},
                    ),
                    _buildMenuItem(
                      icon: Icons.settings_rounded,
                      text: "Settings",
                      onTap: () {},
                    ),

                    const Divider(thickness: 0.8),

                    // 🔹 Logout
                    _buildMenuItem(
                      icon: Icons.logout_rounded,
                      text: "Logout",
                      color: RColors.error,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔸 Top Summary Card
  Widget _buildTopCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: RColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔸 Reusable Menu Item
  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color color = const Color(0xFFFFC107),
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
      onTap: onTap,
    );
  }
}
