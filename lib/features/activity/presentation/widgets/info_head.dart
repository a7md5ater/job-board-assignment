import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/app/injector.dart';
import 'package:job_hunter/core/extensions/user_context.dart';
import 'package:job_hunter/core/extensions/user_role.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';

import '../../../../../../core/shared_widgets/horizontal_space.dart';
import '../../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/font_styles.dart';

class InfoHead extends StatelessWidget {
  const InfoHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26.r,
          backgroundColor: AppColors.primary100,
          child: Text(
            "${context.user?.fullName[0].toUpperCase()}",
            style: FontStyles.semiBold(
              fontSize: 20,
              fontColor: AppColors.backgroundWithe,
            ),
          ),
        ),
        const HorizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.user?.fullName ?? 'unknown',
              style: FontStyles.semiBold(fontSize: 18),
            ),
            const VerticalSpace(2),
            Text(
              "Role: ${context.user?.role.displayName ?? 'unknown'}",
              style: FontStyles.light(
                fontSize: 12,
                fontColor: AppColors.text60,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
