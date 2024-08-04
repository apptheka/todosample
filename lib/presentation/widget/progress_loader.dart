import 'package:todolist/presentation/resources/color_manager.dart';

import '/presentation/resources/app_theme_color.dart';
import '/presentation/resources/values_manager.dart';

import '/presentation/resources/font_manager.dart';
import '/presentation/resources/styles_manager.dart';

import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class ProgressLoaderView extends StatelessWidget {
  final String loadingText;
  const ProgressLoaderView({
    Key? key,
    this.loadingText = "Please Wait",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.bg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CircularProgressIndicator()),
            const SizedBox(
              height: AppSize.s18,
            ),
            getTextView(
              loadingText,
              getMediumStyle(
                  color: ColorManager.appGrey, fontSize: FontSize.s20),
            ),
          ],
        ));
  }
}
