import '/presentation/resources/font_manager.dart';
import '/presentation/widget/app_text.dart';
import '/presentation/widget/padding_view.dart';
import '/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;
  final double fontSize;
  final bool isBoldText;
  final bool isArrowVisible;
  HeaderText(
      {Key? key,
      required this.bgColor,
      required this.txtColor,
      required this.text,
      this.fontSize = 18,
      this.isBoldText = true,
      this.isArrowVisible = false})
      : super(key: key);

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
    if (isArrowVisible) {
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
                width: width * .7,
                child: getPaddingView(
                    edgeInsets: const EdgeInsets.fromLTRB(
                        AppPadding.p12, 15, AppPadding.p12, 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: text,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: txtColor,
                  size: 30.0,
                ),
              ),
            ],
          ));
    }
    return contianer;
  }
}
