import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// .h - Returns a calculated height based on the device
// .w - Returns a calculated width based on the device
// .sp - Returns a calculated sp based on the device
// SizerUtil.orientation - for screen orientation portrait or landscape
// SizerUtil.deviceType - for device type mobile or tablet
class FontSize {
  static TextStyle getFontStyle(int index, double fontSize) {
    if (index == 0)
      return GoogleFonts.roboto(
          fontSize: fontSize, color: Colors.grey.shade700);
    else if (index == 1)
      return GoogleFonts.handlee(
          fontSize: fontSize, color: Colors.grey.shade700);
    else if (index == 2)
      return GoogleFonts.cookie(
          fontSize: fontSize, color: Colors.grey.shade700);
    else if (index == 3)
      return GoogleFonts.josefinSans(
          fontSize: fontSize, color: Colors.grey.shade700);
    else if (index == 4)
      return GoogleFonts.openSans(
          fontSize: fontSize, color: Colors.grey.shade700);
    else if (index == 5)
      return GoogleFonts.oswald(
          fontSize: fontSize, color: Colors.grey.shade700);
    else
      return GoogleFonts.roboto(
          fontSize: fontSize, color: Colors.grey.shade700);
  }

  static TextStyle getFontStyles(
      int index, double fontSize, Color color, FontWeight fontWeight) {
    if (index == 0)
      return GoogleFonts.roboto(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else if (index == 1)
      return GoogleFonts.handlee(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else if (index == 2)
      return GoogleFonts.cookie(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else if (index == 3)
      return GoogleFonts.josefinSans(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else if (index == 4)
      return GoogleFonts.openSans(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else if (index == 5)
      return GoogleFonts.oswald(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
    else
      return GoogleFonts.roboto(
          fontSize: fontSize, color: color, fontWeight: fontWeight);
  }

  static List<double> fontSizeSelect = [
    12.sp,
    14.sp,
    16.sp,
    20.sp,
    24.sp,
  ];

  static double s9 = 9.sp;
  static double s10 = 10.sp;
  static double s12 = 12.sp;
  static double s14 = 14.sp;
  static double s15 = 15.sp;

  static double s16 = 16.sp;
  static double s17 = 17.sp;
  static double s18 = 18.sp;
  static double s20 = 20.sp;
  static double s25 = 25.sp;
  static double s30 = 30.sp;
  static double s35 = 35.sp;
  static double s40 = 40.sp;
  static double s45 = 45.sp;
  static double sectionHeader =
      SizerUtil.deviceType == DeviceType.tablet ? 12.sp : 18.sp;
  static double headerBigTextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s20 : s35;
  static double headerTextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s15 : s20;
  static double headerText2Height =
      SizerUtil.deviceType == DeviceType.tablet ? 12.sp : 16.sp;
  static double headerSubTextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s12 : s14;
  static double headerSub1TextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s12 : 14.sp;
  static double headerSub2TextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s10 : 13.sp;
  static double headerSub3TextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s9 : s12;
  static double headerSub4TextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? 8.sp : s12;
  static double headerSub5TextHeight =
      SizerUtil.deviceType == DeviceType.tablet ? 7.sp : 10.sp;
  static double buttonHeight =
      SizerUtil.deviceType == DeviceType.tablet ? 6.h : 6.h;
  static double buttonTxtHeight =
      SizerUtil.deviceType == DeviceType.tablet ? s9 : s14;

  static double iconHeight =
      SizerUtil.deviceType == DeviceType.tablet ? 17.sp : 20.sp;
}
