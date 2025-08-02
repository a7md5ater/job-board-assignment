import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_widgets/error_widget.dart';
import '../../../../core/shared_widgets/icon.dart';
import '../../../../core/shared_widgets/vertical_space.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/font_styles.dart';
import '../../../home/presentation/widgets/home_jobs/home_jobs_loading_view.dart';
import '../../cubit/submitted_jobs_cubit.dart';
import 'submitted_jobs_list_view.dart';

class SubmittedJobsSliver extends StatelessWidget {
  const SubmittedJobsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmittedJobsCubit, SubmittedJobsState>(
      buildWhen:
          (previous, current) => current.maybeWhen(
            getSubmittedJobsLoading: () => true,
            getSubmittedJobsSuccess: (_) => true,
            getSubmittedJobsError: (_) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return state.maybeWhen(
          getSubmittedJobsLoading: () => HomeJobsLoadingView(),
          getSubmittedJobsSuccess: (jobs) {
            if (jobs.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(
                        icon: AppIcons.document,
                        size: 120,
                        color: AppColors.primary20,
                      ),
                      const VerticalSpace(10),
                      Text(
                        "There are no submitted jobs.",
                        style: FontStyles.regular(
                          fontSize: 14,
                          fontColor: AppColors.text50,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return SubmittedJobsListView(jobs: jobs);
          },

          getSubmittedJobsError:
              (message) => SliverFillRemaining(
                child: CustomErrorWidget(message: message),
              ),
          orElse: () => SizedBox(),
        );
      },
    );
  }
}
