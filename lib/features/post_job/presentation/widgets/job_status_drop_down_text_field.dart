import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_hunter/core/utils/app_enums.dart';
import 'package:job_hunter/features/post_job/cubit/post_job_cubit.dart';

import '../../../../../core/shared_widgets/vertical_space.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_styles.dart';

class JobStatusDropDownTextField extends StatelessWidget {
  final JobStatus jobStatus;
  const JobStatusDropDownTextField({super.key, required this.jobStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: FontStyles.medium(fontColor: AppColors.text80, fontSize: 13),
        ),
        const VerticalSpace(10),
        DropdownButtonFormField<JobStatus>(
          value: jobStatus,
          items: [
            DropdownMenuItem(
              value: JobStatus.open,
              child: Text('Open', style: FontStyles.regular(fontSize: 14)),
            ),
            DropdownMenuItem(
              value: JobStatus.closed,
              child: Text('Closed', style: FontStyles.regular(fontSize: 14)),
            ),
          ],
          dropdownColor: AppColors.backgroundWithe,
          hint: Text(
            'Select Status',
            style: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
          onChanged: (status) {
            context.read<PostJobCubit>().changeJobStatus(
              status: status ?? JobStatus.open,
            );
          },
        ),
      ],
    );
  }
}
