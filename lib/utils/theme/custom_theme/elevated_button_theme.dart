import 'package:flutter/material.dart';
import 'package:rodbez_yard/utils/constants/colors.dart';

class RElevatedButtonTheme{
  RElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(color: Colors.transparent),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(color: Colors.blue),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
      )
  );

  // static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     elevation: 0,
  //     foregroundColor: RColors.white,
  //     backgroundColor: RColors.black,
  //     disabledForegroundColor: RColors.black,
  //     disabledBackgroundColor: RColors.disableButtonColor,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     textStyle: const TextStyle(fontSize: 12,color: RColors.white,fontWeight: FontWeight.w600),
  //     padding: EdgeInsets.symmetric(vertical: 18)
  //   )
  // );
  //
  // static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //         elevation: 0,
  //         foregroundColor: RColors.white,
  //         backgroundColor: RColors.black,
  //         disabledForegroundColor: RColors.black,
  //         disabledBackgroundColor: RColors.disableButtonColor,
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //         textStyle: const TextStyle(fontSize: 12,color: RColors.white,fontWeight: FontWeight.w600),
  //         padding: EdgeInsets.symmetric(vertical: 18)
  //     )
  // );
}