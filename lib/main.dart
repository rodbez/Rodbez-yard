import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rodbez_yard/features/authentication/splash/view/splash_screen.dart';
import 'package:rodbez_yard/utils/constants/texts.dart';
import 'package:rodbez_yard/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: RTexts.appName,
      debugShowCheckedModeBanner: false,
      theme: RAppTheme.lightTheme,
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaler: TextScaler.linear(1.0)),
          child: child ?? const SizedBox(),
        );
      },
      home: SplashScreen(),
    );
  }
}
