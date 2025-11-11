import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:rodbez_yard/common/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../common/widgets/custom_snackbar/custom_snackbar.dart';
import '../../../../data/services/location_service.dart';
import '../../../../data/services/network_manager.dart';
import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/constants/colors.dart';
import '../../../personalization/homepage/view/homepage.dart';

class VerifyOtpController extends GetxController {
  final String phoneNumber;

  VerifyOtpController({required this.phoneNumber});
  final RxBool isLoading = false.obs;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  late Timer _timer;
  final RxInt _secondsLeft = 59.obs;
  final RxBool isResendEnabled = false.obs;
  final RxBool isTimerActive = true.obs;
  final RxBool isPinValid = false.obs;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 22, color: RColors.textBlack),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: RColors.focusedBorderColor),
      color: RColors.white,
    ),
  );

  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
    focusNode = FocusNode();
    formKey = GlobalKey<FormState>();
    _startTimer();
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    _timer.cancel();
    super.onClose();
  }

  void _startTimer() {
    _secondsLeft.value = 59;
    isTimerActive.value = true;
    isResendEnabled.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft.value > 0) {
        _secondsLeft.value--;
      } else {
        _timer.cancel();
        isResendEnabled.value = true;
        isTimerActive.value = false;
      }
    });
  }

  String get formattedTime {
    int minutes = _secondsLeft.value ~/ 60;
    int seconds = _secondsLeft.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  String get mobileWithoutCountryCode {
    String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[-\s()]'), '');

    if (cleanedNumber.startsWith('+91')) {
      return cleanedNumber.substring(3);
    }
    return cleanedNumber;
  }

  Future<void> verifyOtp(String code) async {
    Get.to(CustomBottomNavBar());
    // isLoading.value = true;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? fcmToken = prefs.getString('fcm_token') ?? '';
    // // print("FCM Token in Verify OTP: $fcmToken");
    // final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.verifyOtp);
    // final headers = {"Content-Type": "application/json"};
    // final body = jsonEncode({
    //   "mobile_no": mobileWithoutCountryCode,
    //   "otp": code,
    //   "deviceToken": fcmToken,
    // });
    //
    // try {
    //   final isConnected = await NetworkManager.instance.isConnected();
    //   if (!isConnected) {
    //     isLoading.value = false;
    //     SnackBarUtil.show(message: 'No Internet connection', isError: true);
    //     return;
    //   }
    //
    //   final response = await http.post(url, headers: headers, body: body).timeout(const Duration(seconds: 15));
    //   final responseData = jsonDecode(response.body);
    //   final String message = responseData['message'] ?? 'Something went wrong';
    //   if (response.statusCode == 200 && responseData['success'] == true) {
    //     final token = responseData['data']['token'] ?? '';
    //     final driverIds = responseData["data"]["user"]["id"] ?? '';
    //     await prefs.setInt('driverId', driverIds);
    //     await prefs.setString('auth_token', token);
    //     await prefs.setBool('is_verified', true);
    //     await Get.putAsync(() => LocationService().init());
    //     SnackBarUtil.show(message: message, isError: false);
    //     Get.to(CustomBottomNavBar());
    //   } else {
    //     SnackBarUtil.show(message: message, isError: true);
    //     isPinValid.value = false;
    //   }
    // } on SocketException {
    //   SnackBarUtil.show(message: 'Please check your internet connection and try again.', isError: true);
    // } on TimeoutException {
    //   SnackBarUtil.show(message: 'The request is taking too long. Please try again later.', isError: true);
    // } on FormatException {
    //   SnackBarUtil.show(message: 'Something went wrong while processing data. Please try again.', isError: true);
    // } catch (e) {
    //   isPinValid.value = false;
    //   SnackBarUtil.show(message: "$e", isError: true);
    // } finally {
    //   isLoading.value = false;
    // }
  }

  void resendOtp() async {

    Get.back();


    // final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.resendOtp);
    // final header = {'Content-Type': 'application/json'};
    // final body = jsonEncode({"mobile_no": mobileWithoutCountryCode});
    // try {
    //   final isConnected = await NetworkManager.instance.isConnected();
    //   if (!isConnected) {
    //     SnackBarUtil.show(message: 'No Internet connection', isError: true);
    //     return;
    //   }
    //
    //   final response = await http.post(url, headers: header, body: body);
    //
    //   final data = jsonDecode(response.body);
    //   final String message = data['message'] ?? 'Something went wrong';
    //
    //   if (response.statusCode == 200 && data['success'] == true) {
    //     SnackBarUtil.show(message: message, isError: false);
    //     _startTimer();
    //   }  else {
    //     SnackBarUtil.show(message: message, isError: true);
    //   }
    // } on SocketException {
    //   SnackBarUtil.show(message: 'Please check your internet connection and try again.', isError: true);
    // } on TimeoutException {
    //   SnackBarUtil.show(message: 'The request is taking too long. Please try again later.', isError: true);
    // } on FormatException {
    //   SnackBarUtil.show(message: 'Something went wrong while processing data. Please try again.', isError: true);
    // } catch (e) {
    //   SnackBarUtil.show(message: e.toString(), isError: true);
    // }
  }
}
