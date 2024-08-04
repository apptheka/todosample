import 'package:flutter/material.dart';

Text getTextView(
  String text,
  TextStyle textStyle, {
  TextAlign textAlign = TextAlign.left,
  TextOverflow? textOverflow = null,
  TextDecoration? decoration=null,
  int? maxLine=null, 
}) {
  return Text(text, style: textStyle, textAlign: textAlign,maxLines: maxLine,overflow: textOverflow,);
}
