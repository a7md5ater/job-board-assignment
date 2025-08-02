import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';

import '../../../../../../../core/shared_widgets/button.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../cubit/post_job_cubit.dart';

class PostJobButton extends StatelessWidget {
  final GlobalKey<FormState> postJobFormKey;
  final JobData? jobData;
  const PostJobButton({super.key, required this.postJobFormKey, this.jobData});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostJobCubit, PostJobState>(
      listener: (context, state) {
        state.maybeWhen(
          postJob: (_) {
            if (jobData != null) {
              context.pop();
            }
            context.pop();

            context.showAnimatedSnackbar(
              title: 'SUCCESS',
              message:
                  jobData != null
                      ? 'Your job has been updated successfully.'
                      : 'Your job has been posted successfully.',
              type: SnackBarType.success,
            );
          },
          postJobError: (message) {
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
            postJobLoading: () => true,
            postJob: (_) => true,
            postJobError: (message) => true,
            orElse: () => false,
          ),

      builder: (context, state) {
        return CustomButton(
          text: jobData != null ? 'Update Job' : 'Post Job',
          loadingCondition: state == const PostJobState.postJobLoading(),
          onPressed: () {
            if (postJobFormKey.currentState!.validate()) {
              context.read<PostJobCubit>().postNewJob(jobData: jobData);
            }
          },
        );
      },
    );
  }
}
