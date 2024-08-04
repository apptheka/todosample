import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    TextDecoration? decoration) {
  return GoogleFonts.outfit(
      decoration: decoration,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);

  // TextStyle(
  //     fontSize: fontSize,
  //     fontFamily: fontFamily,
  //     color: color,
  //     fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = 12,
    required Color color,
    TextDecoration? decoration = null}) {
  return _getTextStyle(fontSize, FontWeight.normal, color, decoration);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = 12, required Color color, TextDecoration? decoration}) {
  return _getTextStyle(fontSize, FontWeight.w400, color, decoration);
}
// bold text style

TextStyle getBoldStyle(
    {double fontSize = 12, required Color color, TextDecoration? decoration}) {
  return _getTextStyle(fontSize, FontWeight.bold, color, decoration);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = 12, required Color color, TextDecoration? decoration}) {
  return _getTextStyle(fontSize, FontWeight.w700, color, decoration);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = 12, required Color color, TextDecoration? decoration}) {
  return _getTextStyle(fontSize, FontWeight.w500, color, decoration);
}
