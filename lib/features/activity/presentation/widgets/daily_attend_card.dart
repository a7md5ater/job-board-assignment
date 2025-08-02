import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:job_hunter/core/shared_widgets/horizontal_space.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../config/router/routes.dart';
import '../../../../core/utils/font_styles.dart';
import 'daily_attend_card_data.dart';

class DailyAttendCard extends StatelessWidget {
  final JobData jobData;
  final bool isLast;
  final bool isLoading;
  const DailyAttendCard({
    super.key,
    required this.jobData,
    required this.isLast,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 100.h : 0),
      child: GestureDetector(
        onTap: () {
          if (!isLoading) {
            // Navigate to job details screen
            context.pushNamed(Routes.jobDetails, extra: jobData);
          }
        },
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
                    child: DailyAttendanceCardHead(
                      title: jobData.title ?? "UNKNOWN",
                      description: jobData.description ?? "UNKNOWN",

                      // description: DateFormat(
                      //   'd MMM yyyy',
                      // ).format(DateTime.now())
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  HorizontalSpace(12),
                  CircleAvatar(
                    radius: 24.r,
                    backgroundColor:
                        isLoading
                            ? AppColors.backgroundWithe
                            : AppColors.primary100,
                    child: Text(
                      jobData.createdBy?.substring(0, 1).toUpperCase() ?? "!",
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
                    description: jobData.createdBy ?? "Unknown",
                  ),
                  DailyAttendanceCardBottom(
                    title: 'Created At',
                    description: DateFormat('d MMM yyyy').format(
                      DateTime.parse(
                        jobData.createdAt ?? DateTime.now().toString(),
                      ),
                    ),
                  ),
                  DailyAttendanceCardBottom(
                    title: "Location",
                    description: jobData.location ?? "Unknown",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
