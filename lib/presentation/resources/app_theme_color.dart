import '/presentation/resources/color_manager.dart';
import '/presentation/resources/theme_color.dart';
import 'package:flutter/material.dart';

abstract class AppColors {
  static Color background(BuildContext context) => ThemedColor(
        light: ColorManager.bg,
        dark: ColorManager.bg,
      ).getColor(context);

  static Color primaryContent(BuildContext context) => ThemedColor(
        light: LightThemeColors.primaryContent,
        dark: DarkThemeColors.primaryContent,
      ).getColor(context);

  static Color primaryAccent(BuildContext context) => ThemedColor(
        light: LightThemeColors.primaryAccent,
        dark: DarkThemeColors.primaryAccent,
      ).getColor(context);
  static Color textColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.textColor,
        dark: DarkThemeColors.textColor,
      ).getColor(context);
  static Color headerBgColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.headerBG,
        dark: DarkThemeColors.headerBG,
      ).getColor(context);
  static Color bottomTabBgColor(BuildContext context) => ThemedColor(
        light: Colors.white,
        dark: DarkThemeColors.headerBG,
      ).getColor(context);
  static Color bottomIndicatorColor(BuildContext context) => ThemedColor(
        light: DarkThemeColors.headerBG,
        dark: DarkThemeColors.headerBG,
      ).getColor(context);
  static Color bottomTabTextColor(BuildContext context) => const ThemedColor(
        light: Colors.black,
        dark: Colors.white,
      ).getColor(context);

  static Color agendaBgBGColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.agendaBgBG,
        dark: DarkThemeColors.agendaBgBG,
      ).getColor(context);
  static Color blackTextTextColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.blackText,
        dark: DarkThemeColors.blackText,
      ).getColor(context);
  static Color bottomTabUnselectedTextColor(BuildContext context) =>
      ThemedColor(
        light: LightThemeColors.bottomTabUnselected,
        dark: DarkThemeColors.bottomTabUnselected,
      ).getColor(context);
  static Color tabHeaderBgColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.tabSelected,
        dark: DarkThemeColors.tabSelected,
      ).getColor(context);
  static Color homeHeaderTextColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.headerText,
        dark: DarkThemeColors.headerText,
      ).getColor(context);
  static Color vericalTextColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.tabSelected,
        dark: DarkThemeColors.headerText,
      ).getColor(context);
  static Color dividerColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.tabSelected,
        dark: DarkThemeColors.headerText,
      ).getColor(context);

  static Color appBarColor(BuildContext context) => ThemedColor(
        light: LightThemeColors.appBarColor,
        dark: DarkThemeColors.appBarColor,
      ).getColor(context);
}

final Map<ThemeMode, ThemeData> appThemes = {
  ThemeMode.light: ThemeData(
    // accentColor: LightThemeColors.primaryAccent,
    scaffoldBackgroundColor: LightThemeColors.background,
    primaryColor: LightThemeColors.primaryAccent,
    brightness: Brightness.light,
  ),
  ThemeMode.dark: ThemeData(
    // accentColor: DarkThemeColors.primaryAccent,
    scaffoldBackgroundColor: DarkThemeColors.background,
    primaryColor: DarkThemeColors.primaryAccent,
    brightness: Brightness.dark,
  )
};
