import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rodbez_yard/utils/constants/api_constants.dart';

import '../../../../common/widgets/custom_snackbar/custom_snackbar.dart';
import '../../../../data/services/network_manager.dart';
import '../../verify_otp_screen/view/verify_otp_screen.dart';

class MobileNumberController extends GetxController {
  static MobileNumberController get instance => Get.find();
  final selectedCountry = CountryPickerUtils.getCountryByIsoCode('IN').obs;
  final phoneController = TextEditingController();
  final focusNode = FocusNode();
  final isValid = false.obs;
  final errorText = RxnString();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_validatePhone);
  }

  void requestFocus() {
    Future.delayed(Duration.zero, () {
      focusNode.requestFocus();
    });
  }

  void unfocus() {
    focusNode.unfocus();
  }

  void _validatePhone() {
    final rawPhone = phoneController.text.replaceAll(RegExp(r'\D'), '');
    if (rawPhone.isEmpty) {
      errorText.value = null;
      isValid.value = false;
    } else if (rawPhone.length < 10) {
      errorText.value = 'Please enter a 10-digit number';
      isValid.value = false;
    } else {
      errorText.value = null;
      isValid.value = true;
    }
  }

  Widget buildDropdownItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      const SizedBox(width: 8.0),
      Text("+${country.phoneCode}"),
    ],
  );

  Future<void> signupWithMobile() async {
    final rawPhone = phoneController.text.replaceAll(RegExp(r'\D'), '');
    final countryCode = selectedCountry.value.phoneCode;
    final formattedPhone = '+$countryCode-$rawPhone';
    SnackBarUtil.show(message: "Please enter the OTP", isError: false);
    Get.to(() => VerifyOtpScreen(phoneNumber: formattedPhone));


    // final rawPhone = phoneController.text.replaceAll(RegExp(r'\D'), '');
    //
    // if (rawPhone.isEmpty) {
    //   SnackBarUtil.show(message: "Please enter a valid phone number", isError: true);
    //   return;
    // }
    //
    // final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.register);
    // final headers = {"Content-Type": "application/json"};
    // final body = jsonEncode({"mobile_no": rawPhone});
    //
    // try {
    //   isLoading.value = true;
    //   final isConnected = await NetworkManager.instance.isConnected();
    //   if (!isConnected) {
    //     SnackBarUtil.show(message: 'No Internet connection', isError: true);
    //     isLoading.value = false;
    //     return;
    //   }
    //
    //   final response = await http.post(url, headers: headers, body: body).timeout(const Duration(seconds: 15));
    //   final responseData = jsonDecode(response.body);
    //   final String message = responseData['message'] ?? 'Something went wrong';
    //   if (response.statusCode == 200 && responseData['success'] == true) {
    //     SnackBarUtil.show(message: message, isError: false);
    //     final countryCode = selectedCountry.value.phoneCode;
    //     final formattedPhone = '+$countryCode-$rawPhone';
    //     Get.to(() => VerifyOtpScreen(phoneNumber: formattedPhone));
    //   } else if (response.statusCode == 403) {
    //     SnackBarUtil.show(message: message, isError: true);
    //   } else {
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
    // } finally {
    //   isLoading.value = false;
    // }
  }

  @override
  void onClose() {
    phoneController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
