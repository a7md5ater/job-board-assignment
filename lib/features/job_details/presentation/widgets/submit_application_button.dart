import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';
import 'package:job_hunter/features/job_details/cubit/job_details_cubit.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';

import '../../../../../../../core/shared_widgets/button.dart';
import '../../../../../core/utils/app_enums.dart';

class SubmitApplicationButton extends StatelessWidget {
  final GlobalKey<FormState> submitApplicationJobFormKey;
  final JobData jobData;
  const SubmitApplicationButton({
    super.key,
    required this.submitApplicationJobFormKey,
    required this.jobData,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobDetailsCubit, JobDetailsState>(
      listener: (context, state) {
        state.maybeWhen(
          applyForJobSuccess: () {
            context.pop();
            context.pop();
            context.showAnimatedSnackbar(
              title: 'SUCCESS',
              message: 'Application submitted successfully',
              type: SnackBarType.success,
            );
          },
          applyForJobError: (message) {
            context.showAnimatedSnackbar(
              title: 'ERROR',
              message: message,
              type: SnackBarType.error,
            );
          },
          orElse: () {},
        );
      },
      buildWhen:
          (previous, current) => current.maybeWhen(
            applyForJobLoading: () => true,
            applyForJobSuccess: () => true,
            applyForJobError: (message) => true,
            orElse: () => false,
          ),

      builder: (context, state) {
        return CustomButton(
          text: "SUBMIT",
          loadingCondition: state == const JobDetailsState.applyForJobLoading(),
          onPressed: () {
            if (submitApplicationJobFormKey.currentState!.validate()) {
              context.read<JobDetailsCubit>().applyForJob(jobData: jobData);
            }
          },
        );
      },
    );
  }
}
