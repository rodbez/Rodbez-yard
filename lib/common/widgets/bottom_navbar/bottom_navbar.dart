import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/cab_lists/view/cab_lists.dart';
import 'package:rodbez_yard/features/personalization/homepage/view/homepage.dart';
import 'package:rodbez_yard/features/personalization/notification/view/notification.dart';
import 'package:rodbez_yard/features/personalization/profile/view/profile.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/image_strings.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> screens = const [
    Homepage(),
    CabLists(),
    AnalyticsScreen(),
    NotificationScreen(),
    Profile(),
  ];

  final List<String> icons = [
    RImages.navbarHome,
    RImages.navbarCabIcon,
    RImages.navbarChart,
    RImages.navbarBell,
    RImages.navbarUser,
  ];

  final List<String> labels = [
    'Home',
    'Cablist',
    '',
    'Notifications',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  /// 🧭 Handle back button behavior
  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: RColors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// 🔹 Bottom Row (excluding center)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) {
                  if (index == 2) {
                    // Leave gap for center button
                    return const SizedBox(width: 70);
                  }

                  return GestureDetector(
                    onTap: () => _onItemTapped(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              icons[index],
                              height: 26,
                              width: 26,
                              color: _selectedIndex == index
                                  ? RColors.darkYellow
                                  : RColors.darkGrey,
                            ),
                            // 🔴 Notification badge
                            // if (index == 3)
                            //   Positioned(
                            //     right: 0,
                            //     top: 0,
                            //     child: Container(
                            //       height: 14,
                            //       width: 14,
                            //       decoration: BoxDecoration(
                            //         color: Colors.red,
                            //         borderRadius: BorderRadius.circular(8),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           '7',
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 10,
                            //             fontWeight: FontWeight.bold,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                          ],
                        ),
                        Text(
                          labels[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? RColors.darkYellow
                                : RColors.darkGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),

              Positioned(
                bottom: 2,
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: RColors.darkYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      RImages.navbarChart,
                      height: 26,
                      width: 26,
                      color: RColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) => const Center(
    child: Text('📊 Analytics Screen', style: TextStyle(fontSize: 22)),
  );
}

