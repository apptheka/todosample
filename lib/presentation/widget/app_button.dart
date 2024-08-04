import 'package:flutter/material.dart';
import 'package:todolist/presentation/resources/color_manager.dart';
import 'package:todolist/presentation/resources/font_manager.dart';
import 'package:todolist/presentation/widget/app_text.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final Function() onClick;

  AppButton({required this.btnText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    Color textColor = ColorManager.primaryAppColor;
    
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: textColor,
        ),
        child: getAppRegularTextView(btnText,
            context: context, color: Colors.black, fontSize: FontSize.s12),
      ),
    );
  }
}
