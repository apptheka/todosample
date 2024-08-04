import '/presentation/resources/app_theme_color.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class VerticalHeaderView extends StatelessWidget {
  final String headerText;
  final String valueText;
  final double headerFont;
  final double valueFont;
  const VerticalHeaderView(
      {Key? key,
      required this.headerText,
      required this.valueText,
      this.headerFont = 16,
      this.valueFont = 16})
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
            getMediumStyle(
                color: AppColors.vericalTextColor(context),
                fontSize: headerFont),
          ),
          const SizedBox(
            height: 10,
          ),
          getTextView(
            valueText,
            getRegularStyle(
                color: AppColors.textColor(context), fontSize: valueFont),
          ),
        ],
      ),
    );
  }
}
