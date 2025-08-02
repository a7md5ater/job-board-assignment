import 'package:flutter/material.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../activity/presentation/widgets/daily_attend_card.dart';

class HomeJobsLoadingView extends StatelessWidget {
  const HomeJobsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index.isOdd) {
          return const VerticalSpace(24);
        }
        final jobIndex = index ~/ 2;
        return Skeletonizer(
          enabled: true,
          child: DailyAttendCard(
            jobData: JobData(),
            isLast: jobIndex == 3,
            isLoading: true,
          ),
        );
      }, childCount: 7),
    );
  }
}
