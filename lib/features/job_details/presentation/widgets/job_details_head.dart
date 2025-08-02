import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/horizontal_space.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_styles.dart';
import 'job_details_info_row.dart';

class JobDetailsHead extends StatelessWidget {
  const JobDetailsHead({
    super.key,
    required this.title,
    required this.location,
    required this.salary,
    required this.jobPoster,
  });

  final String title;
  final String location;
  final String salary;
  final String jobPoster;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              JobDetailsInfoRow(
                text: title,
                icon: Icons.work_outline_outlined,
                isHead: true,
              ),
              VerticalSpace(3),
              JobDetailsInfoRow(
                text: location,
                icon: Icons.location_on_outlined,
                isHead: false,
              ),
              VerticalSpace(1),
              JobDetailsInfoRow(
                text: salary,
                icon: Icons.attach_money_outlined,
                isHead: false,
              ),
            ],
          ),
        ),
        HorizontalSpace(12),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.primary100,
          child: Text(
            jobPoster.substring(0, 1).toUpperCase(),
            style: FontStyles.semiBold(
              fontSize: 18,
              fontColor: AppColors.backgroundWithe,
            ),
          ),
        ),
      ],
    );
  }
}
