import 'package:get/get.dart';

class CabModel {
  final String cabNumber;
  final String vehicleType;
  final String vehicleStatus;
  final String driverName;
  final String updatedAt;

  CabModel({
    required this.cabNumber,
    required this.vehicleType,
    required this.vehicleStatus,
    required this.driverName,
    required this.updatedAt,
  });
}

class CabListController extends GetxController {
  static CabListController get instance => Get.find();

  RxList<CabModel> cabList = <CabModel>[].obs;
  var filteredList = <CabModel>[].obs;
  var selectedFilter = 'all'.obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    cabList.value = List.generate(10, (index) {
      return CabModel(
        cabNumber: "BR 0${index + 1}E 12${30 + index}",
        vehicleType: index.isEven ? "Sedan" : "SUV",
        vehicleStatus: index % 3 == 0 ? "Exited" : "Inside",
        driverName: "Driver ${index + 1}",
        updatedAt: "12:${30 + index}",
      );
    });

    // Initialize filteredList with all cabs initially
    filteredList.value = cabList;
  }


  void applyFilter(String filter) {
    selectedFilter.value = filter;
    if (filter == 'all') {
      filteredList.value = cabList;
    } else {
      filteredList.value = cabList
          .where((item) => item.vehicleStatus.toLowerCase() == filter)
          .toList();
    }
  }

}
