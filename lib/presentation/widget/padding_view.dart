import '/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget getPaddingView(
    {EdgeInsets edgeInsets =
        const EdgeInsets.fromLTRB(AppPadding.p12, 0, AppPadding.p12, 0),
    required Widget child}) {
  return Padding(
    padding: edgeInsets,
    child: child,
  );
}
