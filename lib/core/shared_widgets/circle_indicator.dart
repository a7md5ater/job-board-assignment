import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomCircleIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? strokeWidth;
  final double? percentage;
  const CustomCircleIndicator({
    super.key,
    this.size,
    this.color,
    this.strokeWidth,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 30.sp,
        height: size ?? 30.sp,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primary100,
          strokeWidth: strokeWidth ?? 2.sp,
          backgroundColor: percentage != null ? AppColors.text30 : null,
          value: percentage,
        ),
      ),
    );
  }
}
