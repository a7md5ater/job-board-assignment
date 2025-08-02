import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:job_hunter/core/extensions/user_context.dart';
import 'package:job_hunter/core/shared_widgets/app_bar.dart';
import 'package:job_hunter/core/shared_widgets/icon.dart';
import 'package:job_hunter/features/job_details/presentation/widgets/job_details_loading_view.dart';

import '../../../../config/router/routes.dart';
import '../../../../core/shared_widgets/error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../post_job/data/models/job_data.dart';
import '../../cubit/job_details_cubit.dart';
import '../widgets/job_details_button.dart';
import '../widgets/job_details_view.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobData jobData;
  const JobDetailsScreen({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Job Details',
        trailing:
            context.user?.role == UserRole.admin
                ? IconButton(
                  onPressed:
                      () => context.pushNamed(Routes.postJob, extra: jobData),
                  icon: CustomIcon(
                    icon: AppIcons.edit,
                    color: AppColors.primary100,
                  ),
                )
                : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<JobDetailsCubit, JobDetailsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  isAppliedLoading: () => const JobDetailsLoadingView(),
                  isAppliedError:
                      (message) => CustomErrorWidget(message: message),
                  orElse: () => JobDetailsView(jobData: jobData),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: JobDetailsButton(jobData: jobData)),
    );
  }
}
