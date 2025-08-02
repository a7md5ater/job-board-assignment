import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class FontStyles {
  static TextStyle _getTextStyle({
    required FontWeight fontWeight,
    required Color fontColor,
    required double fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    return TextStyle(
      fontFamily: FontFamily.inter,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      color: fontColor,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle bold({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.bold,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle semiBold({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.semiBold,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle medium({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.medium,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle regular({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.regular,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle light({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.light,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  static TextStyle thin({
    Color? fontColor,
    double? fontSize,
    double? letterSpacing,
    double? height,
    String? fontFamily,
  }) {
    double size = fontSize?.sp ?? 14.sp;
    return _getTextStyle(
      fontWeight: FontWeightManager.thin,
      fontFamily: fontFamily,
      fontColor: fontColor ?? AppColors.text100,
      fontSize: size,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}
