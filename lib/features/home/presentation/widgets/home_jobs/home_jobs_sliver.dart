import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/error_widget.dart';
import '../../../cubit/home_cubit.dart';
import 'home_jobs_list_view.dart';
import 'home_jobs_loading_view.dart';

class HomeJobsSliver extends StatelessWidget {
  const HomeJobsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) => current.maybeWhen(
            getJobsLoading: () => true,
            getJobsError: (message) => true,
            getJobsSuccess: (jobs) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return state.maybeWhen(
          getJobsLoading: () => HomeJobsLoadingView(),
          getJobsError:
              (message) => SliverFillRemaining(
                child: CustomErrorWidget(message: message),
              ),
          getJobsSuccess: (jobs) => HomeJobsListView(jobs: jobs),
          orElse: () => const SliverToBoxAdapter(child: Text("SD")),
        );
      },
    );
  }
}
