import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:job_hunter/core/utils/app_colors.dart';

import '../../../../core/shared_widgets/horizontal_space.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../activity/presentation/widgets/daily_attend_card_data.dart';
import '../../../job_details/presentation/widgets/job_details_info_row.dart';
import '../../../post_job/data/models/job_data.dart';

class SubmittedJobCart extends StatelessWidget {
  const SubmittedJobCart({
    super.key,
    required this.jobData,
    required this.isLast,
  });

  final JobData jobData;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 100.h : 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWithe,
          borderRadius: BorderRadius.circular(16.sp),
          border: Border.all(color: AppColors.text20, width: 1.sp),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      JobDetailsInfoRow(
                        text: jobData.title ?? "UNKNOWN",
                        icon: Icons.work_outline_outlined,
                        isHead: true,
                      ),
                      VerticalSpace(3),

                      JobDetailsInfoRow(
                        text: jobData.location ?? "UNKNOWN",
                        icon: Icons.location_on_outlined,
                        isHead: false,
                      ),
                      VerticalSpace(1),
                      JobDetailsInfoRow(
                        text: jobData.salary ?? "UNKNOWN",
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
                    jobData.title?.substring(0, 1).toUpperCase() ?? "!",
                    style: FontStyles.semiBold(
                      fontSize: 18,
                      fontColor: AppColors.backgroundWithe,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Divider(height: 1.sp, color: AppColors.text20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DailyAttendanceCardBottom(
                  title: 'Job Poster',
                  description: jobData.createdBy ?? "UNKNOWN",
                ),
                DailyAttendanceCardBottom(
                  title: 'Created At',
                  description: DateFormat('d MMM yyyy').format(
                    DateTime.parse(
                      jobData.createdAt ?? DateTime.now().toString(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
