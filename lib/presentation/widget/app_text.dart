import 'package:flutter/widgets.dart';

import '/presentation/resources/app_theme_color.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

Text _getAppTextView(String text,
    {required TextStyle textStyle,
    TextAlign textAlign = TextAlign.left,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    TextDecoration? decoration = null,
    int? maxLine = null}) {
  return getTextView(text, textStyle,
      textAlign: textAlign,
      maxLine: maxLine,
      decoration: decoration,
      textOverflow: textOverflow);
}

Text getAppRegularTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    TextDecoration? decoration = null,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLine = null}) {
  return _getAppTextView(text,
      textStyle: getRegularStyle(
          decoration: decoration,
          color: color ?? AppColors.textColor(context),
          fontSize: fontSize),
      textAlign: textAlign,
      textOverflow: textOverflow,
      decoration: decoration,
      maxLine: maxLine);
}

Text getAppMediumTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    TextDecoration? decoration = null,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLine = null}) {
  return _getAppTextView(text,
      textStyle: getMediumStyle(
          decoration: decoration,
          color: color ?? AppColors.textColor(context),
          fontSize: fontSize),
      textAlign: textAlign,
      textOverflow: textOverflow,
      decoration: decoration,
      maxLine: maxLine);
}

Text getAppBoldTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    TextDecoration? decoration = null,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLine = null}) {
  return _getAppTextView(text,
      textStyle: getBoldStyle(
          decoration: decoration,
          color: color ?? AppColors.textColor(context),
          fontSize: fontSize),
      textAlign: textAlign,
      textOverflow: textOverflow,
      decoration: decoration,
      maxLine: maxLine);
}

Text getAppSemiBoldTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    TextDecoration? decoration = null,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLine = null}) {
  return _getAppTextView(text,
      textStyle: getSemiBoldStyle(
          decoration: decoration,
          color: color ?? AppColors.textColor(context),
          fontSize: fontSize),
      textAlign: textAlign,
      textOverflow: textOverflow,
      decoration: decoration,
      maxLine: maxLine);
}

Text getAppLightTextView(String text,
    {required BuildContext context,
    double fontSize = 14,
    TextAlign textAlign = TextAlign.left,
    Color? color,
    TextDecoration? decoration = null,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLine = null}) {
  print(decoration);
  return _getAppTextView(text,
      textStyle: getLightStyle(
          decoration: decoration,
          color: color ?? AppColors.textColor(context),
          fontSize: fontSize),
      textAlign: textAlign,
      textOverflow: textOverflow,
      decoration: decoration,
      maxLine: maxLine);
}
