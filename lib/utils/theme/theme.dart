import 'package:flutter/material.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';
import 'package:rodbez_yard/utils/theme/custom_theme/appbar_theme.dart';
import 'package:rodbez_yard/utils/theme/custom_theme/bottomsheet_theme.dart';
import 'package:rodbez_yard/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:rodbez_yard/utils/theme/custom_theme/text_theme.dart';

class RAppTheme {
  RAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: RColors.white,
    textTheme: RTextTheme.lightTextTheme,
    elevatedButtonTheme: RElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: RAppBarTheme.lightAppbarTheme,
    bottomSheetTheme: RBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: RColors.black,
    textTheme: RTextTheme.darkTextTheme,
    elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: RAppBarTheme.darkAppbarTheme,
    bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
  );
}
