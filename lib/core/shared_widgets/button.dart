import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/font_styles.dart';
import 'circle_indicator.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final bool setShadow;
  final bool loadingCondition;
  final bool regularText;
  final IconData? icon;
  final double? borderRadius;
  final Color? borderColor;
  final double? width;
  final double? height;
  final bool isDisabled;
  const CustomButton({
    super.key,
    required this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.setShadow = false,
    this.loadingCondition = false,
    this.regularText = false,
    this.icon,
    this.borderRadius,
    this.borderColor,
    required this.onPressed,
    this.width,
    this.height,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          isDisabled
              ? null
              : loadingCondition
              ? () {}
              : onPressed,

      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.text50,
        disabledForegroundColor: AppColors.text90,
        minimumSize: Size(width ?? double.infinity, height ?? 52.h),
        backgroundColor: fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
          side:
              borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
        ),
      ),
      child:
          loadingCondition
              ? CustomCircleIndicator(
                color: AppColors.backgroundWithe,
                size: 20.sp,
              )
              : Text(
                text,
                style:
                    regularText
                        ? FontStyles.regular(
                          fontColor: textColor ?? AppColors.backgroundWithe,
                          fontSize: textSize ?? 16.sp,
                        )
                        : FontStyles.semiBold(
                          fontColor: textColor ?? AppColors.backgroundWithe,
                          fontSize: textSize ?? 16.sp,
                        ),
              ),
    );
  }
}
