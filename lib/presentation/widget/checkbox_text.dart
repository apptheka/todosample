import '/presentation/resources/app_theme_color.dart';
import '/presentation/widget/app_check_box.dart';

import '/presentation/resources/color_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class CheckBoxTextView extends StatelessWidget {
  final String text, dateText;
  final TextStyle? dateSyle;
  final TextStyle? textStyle;

  final double? iconWidth;
  final double? iconHeight;
  final double paddingBetween;
  const CheckBoxTextView(
      {Key? key,
      required this.text,
      required this.dateText,
      this.textStyle,
      this.dateSyle,
      this.iconWidth = AppSize.s20,
      this.iconHeight = AppSize.s20,
      this.paddingBetween = AppSize.s0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: AppColors.headerBgColor(context),
      ),
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            const AppCheckBox(),
            SizedBox(
              width: paddingBetween,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: getTextView(
                  dateText,
                  dateSyle ?? getMediumStyle(color: ColorManager.black),
                )),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: getTextView(
                    text,
                    textStyle ?? getMediumStyle(color: ColorManager.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
