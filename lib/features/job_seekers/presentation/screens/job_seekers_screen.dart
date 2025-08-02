import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_hunter/core/shared_widgets/error_widget.dart';
import 'package:job_hunter/core/shared_widgets/icon.dart';
import 'package:job_hunter/core/utils/app_icons.dart';

import '../../../../app/injector.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../activity/presentation/widgets/info_head.dart';
import '../../cubit/job_seekers_cubit.dart';
import '../widgets/job_seekers_list_tile.dart';

class JobSeekersScreen extends StatelessWidget {
  const JobSeekersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<JobSeekersCubit>()..getJobSeekers(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpace(10),
            const InfoHead(),
            const VerticalSpace(30),
            Text("Job Seekers", style: FontStyles.semiBold(fontSize: 28)),
            const VerticalSpace(20),
            Expanded(
              child: BlocBuilder<JobSeekersCubit, JobSeekersState>(
                buildWhen:
                    (previous, current) => current.maybeWhen(
                      getJobSeekersLoading: () => true,
                      getJobSeekersSuccess: (_) => true,
                      getJobSeekersError: (_) => true,
                      orElse: () => false,
                    ),
                builder: (context, state) {
                  return state.maybeWhen(
                    getJobSeekersLoading:
                        () => const Center(child: CircularProgressIndicator()),
                    getJobSeekersSuccess: (jobSeekers) {
                      if (jobSeekers.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIcon(
                                icon: AppIcons.users,
                                size: 120,
                                color: AppColors.primary20,
                              ),
                              const VerticalSpace(10),
                              Text(
                                "No job seekers found",
                                style: FontStyles.regular(
                                  fontSize: 14,
                                  fontColor: AppColors.text50,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: jobSeekers.length,
                        itemBuilder: (context, index) {
                          final jobSeeker = jobSeekers[index];
                          return JobSeekerListTile(
                            name: jobSeeker.fullName,
                            email: jobSeeker.email,
                            firstChar: jobSeeker.fullName[0],
                          );
                        },
                      );
                    },
                    getJobSeekersError:
                        (message) => CustomErrorWidget(message: message),
                    orElse: () => SizedBox(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
