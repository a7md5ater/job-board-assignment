import 'package:flutter/material.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import 'submitted_job_cart.dart';

class SubmittedJobsListView extends StatelessWidget {
  final List<JobData> jobs;
  const SubmittedJobsListView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        if (index.isOdd) {
          return const VerticalSpace(24);
        }
        final jobIndex = index ~/ 2;
        return SubmittedJobCart(
          jobData: jobs[jobIndex],
          isLast: jobIndex == jobs.length - 1,
        );
      }, childCount: jobs.length * 2 - 1),
    );
  }
}
