import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';
    if (digitsOnly.isNotEmpty) {
      formatted += digitsOnly.substring(0, digitsOnly.length.clamp(0, 4));
    }
    if (digitsOnly.length > 4) {
      formatted += '-${digitsOnly.substring(4, digitsOnly.length.clamp(4, 8))}';
    }
    if (digitsOnly.length > 8) {
      formatted += '-${digitsOnly.substring(8, digitsOnly.length.clamp(8, 10))}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
