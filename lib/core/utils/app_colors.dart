import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  /// PRIMARY COLORS
  static const Color primarySurface = Color(0xffF4F8FF);
  static const Color primary20 = Color(0xffD3E5FF);
  static const Color primary40 = Color(0xffA7CBFF);
  static const Color primary60 = Color(0xffC7B0FF);
  static const Color primary80 = Color(0xff5096FF);
  static const Color primary100 = Color(0xff247CFF);

  /// SECONDARY COLORS
  static const Color secondarySurfaceBlue = Color(0xffEAF2FF);
  static const Color secondarySurfaceGreen = Color(0xffE9FAEF);
  static const Color secondarySurfaceRed = Color(0xffFFEEEF);
  static const Color secondarySurfaceText = Color(0xffF2F4F7);
  static const Color secondaryFillBlue = Color(0xff247CFF);
  static const Color secondaryFillGreen = Color(0xff22C55E);
  static const Color secondaryFillRed = Color(0xffFF4C5E);
  static const Color secondaryForm = Color(0xffFDFDFF);

  /// BACKGROUND COLORS
  static const Color backgroundWithe = Color(0xffFFFFFF);
  static const Color backgroundChat = Color(0xffF8F9AD);

  /// WARNING COLORS
  static const Color warning20 = Color(0xffFFF7CC);
  static const Color warning40 = Color(0xffFFFA80);
  static const Color warning60 = Color(0xffFFE455);
  static const Color warning80 = Color(0xffFFDD2A);
  static const Color warning100 = Color(0xffFFD600);

  /// TEXT COLORS
  static const Color text10 = Color(0xffFFFFFF);
  static const Color text20 = Color(0xffF5F5F5);
  static const Color text30 = Color(0xffEDEDED);
  static const Color text40 = Color(0xffE0E0E0);
  static const Color text50 = Color(0xffC2C2C2);
  static const Color text60 = Color(0xff9E9E9E);
  static const Color textBody = Color(0xff757575);
  static const Color text80 = Color(0xff616161);
  static const Color text90 = Color(0xff404040);
  static const Color text100 = Color(0xff242424);

  static MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  static int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );

  static int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
