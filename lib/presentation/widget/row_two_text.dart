import '/presentation/widget/app_text.dart';
import '/presentation/widget/padding_view.dart';
import '/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';

class RowTwoText extends StatelessWidget {
  final String txt;
  final String secText;
  final Color bgColor;
  final Color bg2Color;
  final Color txtColor;
  final double fontSize;
  TextAlign textAlign = TextAlign.left;
  RowTwoText({
    Key? key,
    required this.bgColor,
    required this.bg2Color,
    required this.txtColor,
    required this.txt,
    required this.secText,
    textAlign = TextAlign.left,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
          color: bgColor,
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * .4,
              child: getPaddingView(
                edgeInsets: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: getAppRegularTextView(txt,
                    context: context, color: txtColor, fontSize: fontSize),
              ),
            ),
            SizedBox(
              width: width * .5,
              child: getAppRegularTextView(secText,
                  fontSize: fontSize,
                  color: bg2Color,
                  context: context,
                  textAlign: textAlign),
            ),
          ],
        ));
  }
}
