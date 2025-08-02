import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

extension BottomSheet on BuildContext {
  Future<dynamic> bottomSheet({required Widget child, bool? isDismissible}) {
    return showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible ?? true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundWithe,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.sp),
                topRight: Radius.circular(4.sp),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
