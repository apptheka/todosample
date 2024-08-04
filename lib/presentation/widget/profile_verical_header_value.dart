import 'package:todolist/presentation/resources/color_manager.dart';

import '/presentation/resources/app_theme_color.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class ProfileVerticalHeaderView extends StatelessWidget {
  final String headerText;
  final String valueText;
  final double headerFont;
  final double valueFont;
  final Color headerColor;
  final Color valueColor;
  final int amountValue;
  const ProfileVerticalHeaderView(
      {Key? key,
      required this.headerText,
      required this.valueText,
      this.headerFont = 16,
      this.headerColor = Colors.grey,
      this.valueColor = Colors.black,
      this.valueFont = 16,
      this.amountValue = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          getTextView(
            headerText,
            getMediumStyle(color: headerColor, fontSize: headerFont),
          ),
          const SizedBox(
            height: 5,
          ),
          getTextView(
            valueText,
            getBoldStyle(color: valueColor, fontSize: valueFont),
          ),
        ],
      ),
    );
  }
}
