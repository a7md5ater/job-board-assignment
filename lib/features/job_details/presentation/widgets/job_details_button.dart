import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/alert_dialog.dart';
import 'package:job_hunter/core/extensions/snackbar.dart';
import 'package:job_hunter/core/extensions/user_context.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/shared_widgets/button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../post_job/data/models/job_data.dart';
import '../../cubit/job_details_cubit.dart';

class JobDetailsButton extends StatelessWidget {
  final JobData jobData;
  final bool isApplied;
  const JobDetailsButton({
    super.key,
    required this.jobData,
    this.isApplied = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
      child: BlocConsumer<JobDetailsCubit, JobDetailsState>(
        listener: (context, state) {
          state.maybeWhen(
            deleteJobSuccess: () {
              context.pop();
              context.pop();
            },
            deleteJobError: (message) {
              context.pop();
              context.showAnimatedSnackbar(
                title: 'ERROR',
                message: message,
                type: SnackBarType.error,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final bool isApplied = state.maybeWhen(
            isAppliedSuccess: (value) => value,
            orElse: () => false,
          );
          final bool isAdmin = context.user?.role == UserRole.admin;
          return Skeletonizer(
            enabled: state.maybeWhen(
              isAppliedLoading: () => true,
              orElse: () => false,
            ),
            child: CustomButton(
              isDisabled: isApplied,
              text:
                  isAdmin
                      ? "DELETE"
                      : isApplied
                      ? "Already Applied"
                      : "Apply Now",
              onPressed: () {
                if (isAdmin) {
                  context.alertDialog(
                    title: 'Delete Job',
                    text: "Are you sure you want to delete this job?",
                    okPressed:
                        () => context.read<JobDetailsCubit>().deleteJob(
                          jobId: jobData.id ?? '',
                        ),
                    cancelPressed: () => context.pop(),
                  );
                } else {
                  context.pushNamed(Routes.jobApplication, extra: jobData);
                }
              },
              fillColor:
                  isAdmin ? AppColors.secondaryFillRed : AppColors.primary100,
              textColor: AppColors.backgroundWithe,
            ),
          );
        },
      ),
    );
  }
}
