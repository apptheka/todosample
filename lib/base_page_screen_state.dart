import 'presentation/widget/app_base_bar_with_icon.dart';
import 'base_screen.dart';
// import 'package:fl';
import 'package:flutter/material.dart';

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  bool isAppBar = false;

  @override
  Widget build(BuildContext context) {
    return isAppBar
        ? Scaffold(
            appBar: getBaseAppBar(appBarTitle(), getContext(),
                isWidgetDisplace: false),
            body: Container(
              child: body(),
              color: Colors.white,
            ))
        : Scaffold(
            body: Container(
            child: body(),
            color: Colors.white,
          ));
  }

  Widget body();
}
