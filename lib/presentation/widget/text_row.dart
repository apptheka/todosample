import '/presentation/resources/assets_manager.dart';
import '/presentation/resources/values_manager.dart';

import 'package:flutter/material.dart';

class TextButtonRowView extends StatelessWidget {
  const TextButtonRowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - (AppPadding.p12 * 2);
    return Row(
      children: [
        Container(
          width: width * .77,
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: const BorderSide(color: Colors.teal)),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Type your message here",
                contentPadding: const EdgeInsets.only(left: 20.0),
                fillColor: Colors.white70),
          ),
        ),
        SizedBox(
          width: width * .035,
        ),
        Image.asset(
          "ImageAssets.sentBtn",
          width: width * .10,
          height: width * .10,
        ),
      ],
    );
  }
}
