import 'package:flutter/material.dart';
import 'package:rodbez_yard/features/personalization/leaderboard/view/widgets/all_time.dart';
import 'package:rodbez_yard/features/personalization/leaderboard/view/widgets/monthly.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "Leaderboard",
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) => [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(vertical: RSizes.spaceBtwItems),
                      child: Container(
                        width: RDeviceUtils.getScreenWidth(context) * .75,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFFFFFBE6),
                          border: Border.all(color: const Color(0xFFEDAE10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(RSizes.xs),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: const Color(0xFFEDAE10),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            labelColor: RColors.white,
                            unselectedLabelColor: RColors.textDarkGrey,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                            ),
                            tabs: const [
                              Tab(text: "Monthly"),
                              Tab(text: "All Time"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: TabBarView(
              children: [MonthlyLeaderBoard(), AllTimeLeaderBoard()],
            ),
          ),
        ),
      ),
    );
  }
}
