import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/utils/app_colors.dart';
import 'package:job_hunter/features/job_details/data/models/job_application_model.dart';

import '../../../../core/shared_widgets/app_bar.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/font_styles.dart';

class JobApplicationDetailsScreen extends StatelessWidget {
  final JobApplicationModel application;
  const JobApplicationDetailsScreen({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Job Application Details'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JobApplicationDetailsItem(
                title: "Resume",
                description: application.resume,
              ),
              const VerticalSpace(16),
              JobApplicationDetailsItem(
                title: "Cover Letter",
                description: application.coverLetter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobApplicationDetailsItem extends StatelessWidget {
  final String title;
  final String description;

  const JobApplicationDetailsItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: FontStyles.semiBold(fontSize: 20)),
        VerticalSpace(4),
        Text(
          description,
          style: FontStyles.regular(fontSize: 14, fontColor: AppColors.text80),
        ),
      ],
    );
  }
}
