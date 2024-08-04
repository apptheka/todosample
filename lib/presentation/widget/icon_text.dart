import '/presentation/resources/color_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class IconTextView extends StatelessWidget {
  final String imagePath;
  final String text;
  final TextStyle? textStyle;
  final double? iconWidth;
  final double? iconHeight;
  final double paddingBetween;
  const IconTextView(
      {Key? key,
      required this.imagePath,
      required this.text,
      this.textStyle,
      this.iconWidth = AppSize.s20,
      this.iconHeight = AppSize.s20,
      this.paddingBetween = AppSize.s0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          imagePath,
          width: iconWidth,
          height: iconHeight,
        ),
        SizedBox(
          width: paddingBetween,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: getTextView(
              text,
              textStyle ?? getMediumStyle(color: ColorManager.black),
            ))
      ],
    );
  }
}
