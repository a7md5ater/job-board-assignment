import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'network_image.dart';

class CustomRoundedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxBorder? border;
  final bool isSmall;
  const CustomRoundedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.sp),
        border: border,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.sp),
        child: CustomNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.contain,
          height: height ?? 50.sp,
          width: width ?? 50.sp,
          isSmall: isSmall,
        ),
      ),
    );
  }
}
