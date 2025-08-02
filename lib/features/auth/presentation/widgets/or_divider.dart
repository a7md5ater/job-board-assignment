import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/font_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(height: 1, color: AppColors.text40)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            'Or',
            style: FontStyles.medium(
              fontSize: 13,
              fontColor: AppColors.primary100,
            ),
          ),
        ),
        Expanded(child: Divider(height: 1.h, color: AppColors.text40)),
      ],
    );
  }
}
