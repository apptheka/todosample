import 'package:todolist/presentation/resources/color_manager.dart';

import '/presentation/resources/font_manager.dart';
import '/presentation/widget/app_text.dart';
import '/presentation/widget/padding_view.dart';
import '/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  final String text;
  final String secText;
  final Color bgColor;
  final Color txtColor;
  final double fontSize;
  final bool isBoldText;
  const RowText({
    Key? key,
    required this.bgColor,
    required this.txtColor,
    required this.text,
    this.secText = "See All",
    this.fontSize = 18,
    this.isBoldText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Widget text = getAppBoldTextView(this.text,
        fontSize: fontSize,
        textAlign: TextAlign.left,
        color: txtColor,
        context: context);
    if (!isBoldText) {
      text = getAppRegularTextView(this.text,
          fontSize: fontSize,
          textAlign: TextAlign.left,
          color: txtColor,
          context: context);
    }
    Widget contianer = Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
          color: bgColor,
        ),
        child: getPaddingView(
            edgeInsets: const EdgeInsets.fromLTRB(
                AppPadding.p12, 15, AppPadding.p12, 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: text,
            )));

    contianer = Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * .5,
              child: getPaddingView(
                  edgeInsets: const EdgeInsets.fromLTRB(
                      AppPadding.p12, 15, AppPadding.p12, 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: text,
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              getPaddingView(
                  edgeInsets:
                      const EdgeInsets.fromLTRB(AppPadding.p12, 15, 0, 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: getAppRegularTextView("See All",
                        fontSize: fontSize,
                        textAlign: TextAlign.left,
                        color: ColorManager.appGrey,
                        context: context),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: ColorManager.appGrey,
                  size: 30.0,
                ),
              )
            ]),
          ],
        ));

    return contianer;
  }
}
