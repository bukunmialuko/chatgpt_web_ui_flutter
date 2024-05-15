import 'package:chatgpt_web_ui/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData() {
  return ThemeData(
    primaryColor: Colors.blue,
    primaryColorDark: const Color(0xFF1A212A),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    fontFamily: FontFamily.inter,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
  );
}