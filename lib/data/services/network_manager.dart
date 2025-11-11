import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../common/widgets/custom_snackbar/custom_snackbar.dart';

class NetworkManager extends GetxController{
  static NetworkManager get instance =>Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      SnackBarUtil.show(message: 'No Internet connection', isError: true);
    }
  }

  Future<bool> isConnected() async {
    try{
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      }else{
        return true;
      }
    }on PlatformException catch(e) {
      SnackBarUtil.show(message: "Error checking connectivity: $e", isError: true);
      // print('Error checking connectivity: $e');
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}