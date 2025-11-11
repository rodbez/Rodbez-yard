import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodbez_yard/features/personalization/cab_lists/controller/cab_list_controller.dart';
import 'package:rodbez_yard/features/personalization/cab_lists/view/widgets/cab_list_card.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/constants/sizes.dart';

class CabLists extends StatelessWidget {
  const CabLists({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CabListController());
    return Scaffold(
      backgroundColor: RColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cab Lists",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),

      /// 🔹 Body Split: Filters fixed, list scrollable
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// 🔹 Fixed Filter Section
            Container(
              margin: EdgeInsets.only(
                top: RSizes.smallSpace,
                left: RSizes.smallSpace,
                right: RSizes.smallSpace,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE5EBF1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(RSizes.borderRadiusMd),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(RSizes.sm),

                /// 🔹 Horizontal scrollable filter buttons
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      _buildFilterButton(
                        label: "All",
                        value: "all",
                        controller: controller,
                      ),
                      const SizedBox(width: 8),
                      _buildFilterButton(
                        label: "Inside",
                        value: "inside",
                        controller: controller,
                      ),
                      const SizedBox(width: 8),
                      _buildFilterButton(
                        label: "Exited",
                        value: "exited",
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: RSizes.sm),

            /// 🔹 Scrollable Cab List Section
            Expanded(
              child: Obx(() {
                final listToShow = controller.selectedFilter.value == 'all'
                    ? controller.cabList
                    : controller.filteredList;

                if (listToShow.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("No Cabs Available"),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.only(left: RSizes.smallSpace,right: RSizes.smallSpace,bottom: RSizes.smallSpace),
                  itemCount: listToShow.length,
                  itemBuilder: (context, index) {
                    final cab = listToShow[index];
                    return CabListCard(
                      cabNumber: cab.cabNumber,
                      vehicleType: cab.vehicleType,
                      vehicleStatus: cab.vehicleStatus,
                      driverName: cab.driverName,
                      updatedAt: cab.updatedAt,
                      onTap: () => debugPrint("Tapped ${cab.cabNumber}"),
                      onTapChangeDriver: () =>
                          debugPrint("Change Driver for ${cab.cabNumber}"),
                      onTapViewMap: () =>
                          debugPrint("View ${cab.cabNumber} on Map"),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    required String value,
    required CabListController controller,
  }) {
    return Obx(() {
      final isSelected = controller.selectedFilter.value == value;
      return GestureDetector(
        onTap: () => controller.applyFilter(value),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? RColors.white : const Color(0xFFE5EBF1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 5,
                offset: const Offset(2, 3),
              )
            ]
                : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              color: RColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
