import '/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

Widget getCard(
    {EdgeInsets edgeInsets =
        const EdgeInsets.fromLTRB(AppPadding.p12, 0, AppPadding.p12, 0),
    double circlurRadius = 10.0,
    Color color = Colors.white,
    required Widget child}) {
  return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circlurRadius),
      ),
      margin: edgeInsets,
      color: color,
      shadowColor: Colors.grey.shade200,
      child: child);
}
