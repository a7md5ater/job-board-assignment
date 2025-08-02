import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const CustomIcon({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          color ?? Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
        width: size?.sp ?? 22.sp,
        height: size?.sp ?? 22.sp,
      ),
    );
  }
}
