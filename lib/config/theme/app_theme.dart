import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krunal_portfolio/config/theme/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.appScaffoldBackgroundColor,
  fontFamily: GoogleFonts.lato.toString(),
  hintColor: AppColors.lightGreyColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // ✅ Status bar color
      statusBarIconBrightness: Brightness.dark, // Android icons
      statusBarBrightness: Brightness.light, // iOS
    ),
  ),
  textTheme: TextTheme(
    labelMedium: TextStyle(
      color: AppColors.textLightColor,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.appBlackColor,
    secondary: AppColors.appWhiteColor,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.appBlackColor,
  fontFamily: GoogleFonts.lato.toString(),
  hintColor: AppColors.lightGreyColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  ),
  textTheme: TextTheme(
    labelMedium: TextStyle(
      color: AppColors.textDarkColor,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.appWhiteColor,
    secondary: AppColors.appBlackColor,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);