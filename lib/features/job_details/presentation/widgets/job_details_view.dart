import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/user_context.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/shared_widgets/button.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../post_job/data/models/job_data.dart';
import 'job_details_head.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.jobData});

  final JobData jobData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobDetailsHead(
          title: jobData.title ?? "UNKNOWN",
          location: jobData.location ?? "UNKNOWN",
          salary: jobData.salary ?? "UNKNOWN",
          jobPoster: jobData.createdBy ?? "UNKNOWN",
        ),
        if (context.user?.role == UserRole.admin) const VerticalSpace(20),
        if (context.user?.role == UserRole.admin)
          CustomButton(
            text: "View Applications",
            borderRadius: 6.r,
            onPressed:
                () => context.pushNamed(
                  Routes.jobApplications,
                  extra: jobData.id ?? '',
                ),
          ),
        const VerticalSpace(40),
        Text(
          jobData.description ?? "UNKNOWN",
          style: FontStyles.regular(
            fontSize: 14,
            fontColor: Colors.black,
            height: 1.5,
          ),
        ),
        const VerticalSpace(40),
      ],
    );
  }
}
