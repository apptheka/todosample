import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String labelText;
  final Widget? prefixIcon;
  // final Widget? prefixPwdIcon;
  // final MultiValidator? customValidator;

  const AppText({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    // this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        // validator: customValidator ?? MultiValidator([]),
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            //  Icon(
            //   Icons.email,
            //   //color: Colors.green,
            // ),
            errorStyle: const TextStyle(fontSize: 18.0),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 23, 10, 9)),
                borderRadius: BorderRadius.all(Radius.circular(9.0)))));
  }
}
