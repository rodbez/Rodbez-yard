import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class RAppBarTheme{
  RAppBarTheme._();

  static const lightAppbarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: RColors.black,size: RSizes.iconMd),
      actionsIconTheme: IconThemeData(color: RColors.black,size: RSizes.iconMd),
      titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: RColors.black)
  );

  static const darkAppbarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: RColors.black,size: RSizes.iconMd),
      actionsIconTheme: IconThemeData(color: RColors.white,size: RSizes.iconMd),
      titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: RColors.white)
  );
}