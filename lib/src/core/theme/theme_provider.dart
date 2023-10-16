import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_code_scanner_flutter/src/core/theme/custom_text_theme.dart';

final themeProvider =
    StateNotifierProvider.autoDispose<ThemeProvider, ThemeData>((ref) {
  return ThemeProvider();
});

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(lightTheme) {
    currentTheme = lightTheme;
  }
  late ThemeData currentTheme;
  void toggleTheme() {
    if (state == ThemeProvider.lightTheme) {
      state = ThemeProvider.darkTheme;
    } else {
      state = ThemeProvider.lightTheme;
    }
  }

  ThemeData get getCurrentTheme => currentTheme;

  static final ThemeData lightTheme = ThemeData(
    indicatorColor: Colors.black,
    brightness: Brightness.light,
    cardColor: const Color(0xffaacc74),
    shadowColor: const Color(0xffcfdcec),
    splashColor: Colors.white,
    dialogBackgroundColor: const Color(0xffF39F5A),
    canvasColor: const Color(0xfff0f0f0),
    primaryColor: const Color(0xff265cbe),
    disabledColor: const Color(0xff6499E9),
    textTheme: TextTheme(
      displayLarge:
          CustomTextTheme.instance!.headline57.copyWith(color: Colors.black),
      displayMedium:
          CustomTextTheme.instance!.headline45.copyWith(color: Colors.black),
      displaySmall:
          CustomTextTheme.instance!.headline36.copyWith(color: Colors.black),
      headlineLarge:
          CustomTextTheme.instance!.headline32.copyWith(color: Colors.black),
      headlineMedium:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.black),
      headlineSmall:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.black),
      titleLarge:
          CustomTextTheme.instance!.headline22.copyWith(color: Colors.black),
      titleMedium:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.black),
      titleSmall:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.black),
      labelLarge:
          CustomTextTheme.instance!.headline14l.copyWith(color: Colors.black),
      labelMedium:
          CustomTextTheme.instance!.headline12l.copyWith(color: Colors.black),
      labelSmall:
          CustomTextTheme.instance!.headline11l.copyWith(color: Colors.black),
      bodyLarge:
          CustomTextTheme.instance!.headline16b.copyWith(color: Colors.black),
      bodyMedium:
          CustomTextTheme.instance!.headline14b.copyWith(color: Colors.black),
      bodySmall:
          CustomTextTheme.instance!.headline12b.copyWith(color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff73a9e6)),
  );

  static final ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.white,
    disabledColor: const Color(0xff6499E9),
    cardColor: const Color(0xff73a9e6),
    shadowColor: const Color(0xff343942),
    primaryColor: const Color(0xff5d5d5d),
    splashColor: Colors.black,
    canvasColor: const Color(0xffcdcdd2),
    dialogBackgroundColor: const Color(0xffF39F5A),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      displayLarge:
          CustomTextTheme.instance!.headline57.copyWith(color: Colors.white),
      displayMedium:
          CustomTextTheme.instance!.headline45.copyWith(color: Colors.white),
      displaySmall:
          CustomTextTheme.instance!.headline36.copyWith(color: Colors.white),
      headlineLarge:
          CustomTextTheme.instance!.headline32.copyWith(color: Colors.white),
      headlineMedium:
          CustomTextTheme.instance!.headline28.copyWith(color: Colors.white),
      headlineSmall:
          CustomTextTheme.instance!.headline24.copyWith(color: Colors.white),
      titleLarge:
          CustomTextTheme.instance!.headline22.copyWith(color: Colors.white),
      titleMedium:
          CustomTextTheme.instance!.headline16.copyWith(color: Colors.white),
      titleSmall:
          CustomTextTheme.instance!.headline14.copyWith(color: Colors.white),
      labelLarge:
          CustomTextTheme.instance!.headline14l.copyWith(color: Colors.white),
      labelMedium:
          CustomTextTheme.instance!.headline12l.copyWith(color: Colors.white),
      labelSmall:
          CustomTextTheme.instance!.headline11l.copyWith(color: Colors.white),
      bodyLarge:
          CustomTextTheme.instance!.headline16b.copyWith(color: Colors.white),
      bodyMedium:
          CustomTextTheme.instance!.headline14b.copyWith(color: Colors.white),
      bodySmall:
          CustomTextTheme.instance!.headline12b.copyWith(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xff27323a),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff5d5d5d)),
  );
}
