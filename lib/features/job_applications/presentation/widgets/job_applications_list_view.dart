import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/config/router/routes.dart';

import '../../../../core/shared_widgets/icon.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../job_details/data/models/job_application_model.dart';
import '../../../job_seekers/presentation/widgets/job_seekers_list_tile.dart';

class JobApplicationsListView extends StatelessWidget {
  final List<JobApplicationModel> jobApplications;
  const JobApplicationsListView({super.key, required this.jobApplications});

  @override
  Widget build(BuildContext context) {
    if (jobApplications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIcon(
              icon: AppIcons.document,
              size: 120.sp,
              color: AppColors.primary20,
            ),
            const VerticalSpace(10),
            Text(
              "There are no job applications yet.",
              style: FontStyles.regular(
                fontSize: 14,
                fontColor: AppColors.text50,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => JobSeekerListTile(
            name: jobApplications[index].fullName,
            email: jobApplications[index].email,
            firstChar: jobApplications[index].fullName[0],
            onTap:
                () => context.push(
                  Routes.jobApplicationDetails,
                  extra: jobApplications[index],
                ),
          ),
      separatorBuilder: (context, index) => const VerticalSpace(0),
      itemCount: jobApplications.length,
    );
  }
}
