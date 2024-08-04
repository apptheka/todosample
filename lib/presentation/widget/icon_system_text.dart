import '/presentation/resources/styles_manager.dart';
import '/presentation/widget/text_view.dart';
import 'package:flutter/material.dart';

class IconSystemTextView extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final double? size;
  final Color color;
  final VoidCallback onPressed;
  const IconSystemTextView(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed,
      this.textStyle,
      this.size = 30,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(
            icon,
            size: size,
            color: color,
          ),
          highlightColor: Colors.grey.shade200,
          onPressed: onPressed,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: getTextView(
              text,
              textStyle ?? getMediumStyle(color: color),
            ))
      ],
    );
  }
}
