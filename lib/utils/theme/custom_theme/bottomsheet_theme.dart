import 'package:flutter/material.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';

class RBottomSheetTheme{
  RBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: RColors.white,
    modalBackgroundColor: RColors.white,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );
  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: RColors.black,
      modalBackgroundColor: RColors.black,
      constraints: BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );
}