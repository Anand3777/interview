import 'package:crewmeister/core/resources/color_manager.dart';
import 'package:crewmeister/core/resources/constants.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData defaultTheme = ThemeData(
    textTheme: textThemeDefault(),
    elevatedButtonTheme: buttonThemeData(),
    // fontFamily: FontManager.fontFamily,
    useMaterial3: true,
    // package: Constants.package,
    dividerColor: Colors.transparent,
    tooltipTheme: toolTipTheme(),
  );
}

TextTheme textThemeDefault() {
  return const TextTheme(
    titleMedium: TextStyle(
      fontSize: Constants.size_22,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: Constants.size_20,
      fontWeight: FontWeight.w300,
    ),
    labelSmall: TextStyle(
      fontSize: Constants.size_9,
      fontWeight: FontWeight.w400,
      color: ColorManager.ffffffff,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w300,
      color: ColorManager.ffffffff,
      fontSize: Constants.size_18,
    ),
    labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: ColorManager.ffffffff,
        fontSize: Constants.size_18),
    displayLarge: TextStyle(
        fontSize: Constants.size_20,
        fontWeight: FontWeight.w600,
        color: ColorManager.ffffffff),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      color: ColorManager.fff8f8f8,
      fontSize: Constants.size_12,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: Constants.size_14,
      color: ColorManager.ffffffff,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w200,
      color: ColorManager.ffffffff,
      fontSize: Constants.size_36,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      color: ColorManager.ffffffff,
      fontSize: Constants.size_36,
    ),
    headlineMedium: TextStyle(
      fontSize: Constants.size_28,
      fontWeight: FontWeight.w600,
      color: ColorManager.ffffffff,
    ),
    headlineSmall: TextStyle(
      fontSize: Constants.size_14,
      fontWeight: FontWeight.w400,
      color: ColorManager.ffffffff,
    ),
    bodySmall: TextStyle(
      fontSize: Constants.size_13,
      color: ColorManager.ffb1b1bb,
      fontWeight: FontWeight.w600,
    ),
  );
}

TooltipThemeData toolTipTheme() {
  return const TooltipThemeData(
    textStyle: TextStyle(
      fontSize: Constants.size_12,
      color: ColorManager.ffffffff,
    ),
  );
}

ElevatedButtonThemeData buttonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: Constants.elevation_3,
      padding: const EdgeInsets.all(Constants.padding_8),
      enableFeedback: true,
      alignment: Alignment.center,
      shadowColor: ColorManager.ffe0e0e0,
      side: const BorderSide(
        color: ColorManager.ff6022a6,
        width: Constants.width_2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Constants.radius_8,
        ),
      ),
    ),
  );
}
