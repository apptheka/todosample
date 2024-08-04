import '/app/constant.dart';
import '/app/functions.dart';
import '/presentation/resources/app_theme_color.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/routes_manager.dart';
import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/base_app_bar.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

BaseAppBar getBaseAppBar(String text, BuildContext context,
    {bool isWidgetDisplace = true}) {
  var widgets = <Widget>[
    // IconButton(
    //   icon: Icon(Icons.search, size: 40, color: AppColors.textColor(context)),
    //   onPressed: () {},
    // ),
    const SizedBox(
      width: 10,
    ),
    GestureDetector(
        onTap: () {
          // if (!isLogin()) {
          //   Navigator.pushReplacementNamed(context, Routes.loginRoute);
          // } else {
          //   Navigator.pushNamed(context, Routes.profileRoute);
          // }
        },
        child: Image.network(
          'https://icon-library.com/images/user-icon-png-transparent/user-icon-png-transparent-17.jpg',
          width: 45,
          height: 45,
        )),
    const SizedBox(
      width: 10,
    )
  ];
  if (!isWidgetDisplace) {
    widgets = [];
  }
  return BaseAppBar(
    title: getTextView(
      text,
      getMediumStyle(
          color: AppColors.textColor(context), fontSize: FontSize.s25),
    ),
    backgroundColor: AppColors.appBarColor(context),
    appBar: AppBar(),
    widgets: widgets,
  );
}
