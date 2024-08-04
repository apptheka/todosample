import 'package:flutter/material.dart';

class ColorManager {
  static Color textColor = Colors.yellow.shade700;

  static Color primary = const Color(0xFFFFFFFF);
  static Color primaryDarBlue = HexColor.fromHex("#3E47DA");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color get primaryLavendar => const Color(0xFF96A0DF);
  static Color get blue => const Color(0xFF3E47DA);
  static Color get blackText => const Color(0xFF2E333F);
  static Color get appBlue => const Color(0xFF0078FF);
  static Color get appGrey => const Color(0xFF9B9B9B);
  static Color get topBarGrey => const Color(0xFF383740);
  static Color get headerGrey => const Color(0xFFB7BABF);
  static Color get headerBlack => const Color(0xFF3F3E4E);
  static Color get blueGradientOne => const Color(0xFF00ECC2);
  static Color get blueGradientTwo => const Color(0xFF0078FF);
  static Color get whatNewColor1 => const Color(0xFF0078FF);
  static Color get whatNewColor2 => const Color(0xFFFF4359);
  static Color get whatNewColor3 => const Color(0xFF00ECC2);
  static Color get bgDark => const Color(0xFF21202a);
  static Color get primaryAppColor => Colors.yellow.shade700;

  static Color get bg => const Color(0xFFF4F5FA);
  // new colors
  static Color darkPrimary = HexColor.fromHex("#2E333F");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black = HexColor.fromHex("#000000");
  static Color purple = HexColor.fromHex("#3E47DA");
  static Color lightBlue = HexColor.fromHex("#EBF0FE");
  static Color get eventYellow => const Color(0xFFFFD711);
  static Color get eventRed => const Color(0xFFFF001A);
  static Color get eventGreen => const Color(0xFF00FF3C);
  static Color get darkBgBox => const Color(0xFF707070);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

abstract class LightThemeColors {
  static Color get background => const Color(0xFFFFFFFF);
  static Color get primaryContent => const Color(0xFF000000);
  static Color get primaryAccent => const Color(0xFF99283F);
  static Color get textColor => const Color(0xFF000000);
  static Color get headerBG => const Color(0xFFEBF0FE);
  static Color get agendaBgBG => const Color(0xFFEBF0FE);
  static Color get headerText => const Color(0xFF2E333F);

  static Color get tabSelected => const Color(0xFF3E47DA);
  static Color get bottomTabUnselected => const Color(0xFF2E333F);
  static Color get appBarColor => const Color(0xFFFFFFFF);
  static Color get blackText => const Color(0xFF111725);
}

abstract class DarkThemeColors {
  static Color get background => const Color(0xFFFFFFFF);
  static Color get primaryContent => const Color(0xFFE1E1E1);
  static Color get primaryAccent => const Color(0xFF000000);
  static Color get textColor => const Color(0xFFFFFFFF);
  static Color get headerBG => const Color(0xFF2E333F);
  static Color get headerText => const Color(0xFFA3A5AA);
  static Color get agendaBgBG => const Color(0xFF3E47DA);

  static Color get tabSelected => const Color(0xFF3E47DA);
  static Color get bottomTabUnselected => const Color(0xFF7F8082);
  static Color get appBarColor => const Color(0xFF2E333F);
  static Color get blackText => const Color(0xFF9B9EA4);
}

