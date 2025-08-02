import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/shared_widgets/error_widget.dart';

import '../../../../core/shared_widgets/app_bar.dart';
import '../../cubit/job_applications_cubit.dart';
import '../widgets/job_applications_list_view.dart';
import '../widgets/job_applications_loading_view.dart';

class JobApplicationsScreen extends StatelessWidget {
  const JobApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Job Applications'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: BlocBuilder<JobApplicationsCubit, JobApplicationsState>(
            builder: (context, state) {
              return state.maybeWhen(
                getJobApplicationsLoading: () => JobApplicationsLoadingView(),
                getJobApplicationsSuccess:
                    (jobApplications) => JobApplicationsListView(
                      jobApplications: jobApplications,
                    ),
                getJobApplicationsError:
                    (message) => CustomErrorWidget(message: message),
                orElse: () => SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
