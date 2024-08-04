import 'package:flutter/material.dart';
import 'package:todolist/presentation/resources/color_manager.dart';

import '/app/constant.dart';
import 'package:hive/hive.dart';

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

Future<Box> getOpenBox(String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    return await Hive.openBox(boxName);
  }
  return Hive.box(boxName);
}

bool isLogin() {
  var _box = Hive.box(HiveConstant.ADD_BOX);
  String? token = _box.get(HiveFieldConstant.TOKEN);
  print("is login ${token != null}");
  return token != null;
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < 1100 &&
    MediaQuery.of(context).size.width >= 650;

bool isWeb(BuildContext context) => MediaQuery.of(context).size.width >= 1100;

Future<void> onTapTimeFunction(
    {required BuildContext context,
    required Function(TimeOfDay) dateSelected}) async {
  TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
            child: child!,
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                // change the border color
                primary: ColorManager.primaryAppColor,
                // change the text color
                onSurface: Colors.black,
              ),

              // button colors
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.green,
                ),
              ),
            ));
      });
  if (pickedTime != null) {
    dateSelected(pickedTime);
  }
}

 onTapFunction({required BuildContext context,required Function(DateTime) dateSelected}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(9999),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.highContrastLight(
                    primary: ColorManager.primaryAppColor,
                    onPrimary: Colors.black54,
                    onSurface: Colors.black54),
                textButtonTheme: TextButtonThemeData(
                    style:
                        TextButton.styleFrom(foregroundColor: Colors.black54)),
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(bodySmall: TextStyle(color: Colors.white))),
            child: child!);
      },
    );
    if (pickedDate == null) return;
    dateSelected(pickedDate);
  }
