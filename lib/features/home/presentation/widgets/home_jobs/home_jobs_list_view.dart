import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';

import '../../../../../../core/utils/font_styles.dart';
import '../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../activity/presentation/widgets/daily_attend_card.dart';

class HomeJobsListView extends StatelessWidget {
  final List<JobData> jobs;
  const HomeJobsListView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    if (jobs.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.work_off, size: 120.sp, color: AppColors.primary20),
              const VerticalSpace(10),
              Text(
                "There are no jobs available.",
                style: FontStyles.regular(
                  fontSize: 14,
                  fontColor: AppColors.text50,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index.isOdd) {
          return const VerticalSpace(24);
        }
        final jobIndex = index ~/ 2;
        return DailyAttendCard(
          jobData: jobs[jobIndex],
          isLast: jobIndex == jobs.length - 1,
        );
      }, childCount: jobs.length * 2 - 1),
    );
  }
}
