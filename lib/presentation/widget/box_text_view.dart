import 'package:dia/dia.dart';
import 'package:todolist/presentation/resources/color_manager.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/widget/app_text.dart';

import '/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget getBoxText({required String text, required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(.3),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black87.withOpacity(.4),
            Colors.white.withOpacity(.1),
          ],
        )),
    padding: EdgeInsets.all(8),
    child: getAppLightTextView(text,
        color: ColorManager.white, fontSize: FontSize.s12, context: context),
  );
}
