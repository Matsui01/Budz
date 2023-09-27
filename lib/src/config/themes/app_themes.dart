import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2371EE)),
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: 'Outfit',
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColor.font,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: Color(0xFF171D1F)),
      ),
      dialogBackgroundColor: AppColor.white,
      dialogTheme: const DialogTheme(
        surfaceTintColor: AppColor.white,
        backgroundColor: AppColor.white,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 255, 255, 255),
      ),
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff181a20),
    );
  }
}
