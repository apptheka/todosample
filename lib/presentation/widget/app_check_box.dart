import '/presentation/resources/app_theme_color.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({Key? key}) : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            _value = !_value;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: _value
              ? Icon(
                  Icons.check_box,
                  size: 30.0,
                  color: AppColors.textColor(context),
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  size: 30.0,
                  color: AppColors.textColor(context),
                ),
        ),
      ),
    );
  }
}
