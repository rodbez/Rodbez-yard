import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class RTextTheme {
  RTextTheme._();

  static TextTheme lightTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 32, fontWeight: FontWeight.bold, color:RColors.textBlack),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 24, fontWeight: FontWeight.w600, color:RColors.textBlack),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 18, fontWeight: FontWeight.w600, color:RColors.textBlack),

    titleLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w600, color:RColors.textBlack),
    titleMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w500, color:RColors.textBlack),
    titleSmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14, fontWeight: FontWeight.w400, color:RColors.textBlack),

    bodyLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w500, color:RColors.textBlack),
    bodyMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14, fontWeight: FontWeight.normal, color:RColors.textBlack),
    bodySmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color:RColors.textBlack.withOpacity(0.5)),


    labelLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 12, fontWeight: FontWeight.normal, color:RColors.textBlack),
    labelMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color:RColors.textBlack.withOpacity(0.5)),
    labelSmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 10, fontWeight: FontWeight.normal, color:RColors.textBlack),

  );
  static TextTheme darkTextTheme = TextTheme(

    headlineLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),

    titleLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    titleMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    titleSmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),

    bodyLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: const TextStyle().copyWith(
        fontFamily: 'Nunito',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.white.withOpacity(0.5)),

  );
}
