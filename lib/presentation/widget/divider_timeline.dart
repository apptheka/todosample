import 'package:flutter/material.dart';
import 'package:todolist/presentation/resources/color_manager.dart';

Widget divideView() {
  return SizedBox(
    width: 10,
    child: Column(
        children: List.generate(2, (index) {
      return _circle();
    })),
  );
}

Widget _circle() {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 2, bottom: 2),
      height: 8,
      width: 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(2.3),
        ),
        border: Border.all(
          width: 1,
          color: ColorManager.primaryAppColor,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}
