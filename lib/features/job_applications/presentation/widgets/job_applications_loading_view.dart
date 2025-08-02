import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../job_seekers/presentation/widgets/job_seekers_list_tile.dart';

class JobApplicationsLoadingView extends StatelessWidget {
  const JobApplicationsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder:
            (context, index) => JobSeekerListTile(
              name: "name" * 3,
              email: "email" * 2,
              firstChar: 'a',
              isLoading: true,
            ),
        separatorBuilder: (context, index) => const VerticalSpace(0),
        itemCount: 3,
      ),
    );
  }
}
