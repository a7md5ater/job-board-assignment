import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/horizontal_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_styles.dart';

class JobDetailsInfoRow extends StatelessWidget {
  const JobDetailsInfoRow({
    super.key,
    required this.text,
    required this.icon,
    required this.isHead,
  });

  final String text;
  final IconData icon;
  final bool isHead;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20.sp, color: AppColors.primary80),
        HorizontalSpace(8.w),
        Flexible(
          child: Text(
            text,
            style:
                isHead
                    ? FontStyles.semiBold(
                      fontSize: 20,
                      fontColor: AppColors.text100,
                    )
                    : FontStyles.regular(
                      fontSize: 14,
                      fontColor: AppColors.text60,
                    ),
            // maxLines: 1,
          ),
        ),
      ],
    );
  }
}
