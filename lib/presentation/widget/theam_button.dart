import '/presentation/widget/padding_view.dart';

import '/presentation/resources/color_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  String text;
  double fontSize;
  VoidCallback onPressed;
  Color? buttonColor;
  Color? buttonTextColor;
  ButtonView(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.onPressed,
      this.buttonColor,
      this.buttonTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: getPaddingView(
          edgeInsets: const EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: getTextView(
            text,
            getBoldStyle(
                color: buttonTextColor ?? ColorManager.white,
                fontSize: fontSize),
          )),
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? ColorManager.primaryAppColor,
          shape: const StadiumBorder()),
    );
  }
}
