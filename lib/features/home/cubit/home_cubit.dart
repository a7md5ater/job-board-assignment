import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/app/injector.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:job_hunter/features/job_seekers/presentation/screens/job_seekers_screen.dart';

import '../../../../../core/utils/app_icons.dart';
import '../../activity/domain/usecases/get_jobs_use_case.dart';
import '../../activity/presentation/screens/activity_screen.dart';
import '../../auth/data/models/user_model.dart';
import '../../post_job/data/models/job_data.dart';
import '../../settings/presentation/screens/settings_screen.dart';
import '../../submitted_jobs/presentation/screens/submitted_jobs_screen.dart';
import '../nav_bar_item.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetJobsUseCase _getJobsUseCase;
  HomeCubit({required GetJobsUseCase getJobsUseCase})
    : _getJobsUseCase = getJobsUseCase,
      super(const HomeState.changeNavBarIndex(0));

  void changeNavBar({required int index}) {
    emit(HomeState.changeNavBarIndex(index));
  }

  StreamSubscription? _jobsSubscription;
  void getJobs() async {
    emit(HomeState.getJobsLoading());
    await _jobsSubscription?.cancel();
    final result = await _getJobsUseCase();
    result.fold(
      (failure) => emit(HomeState.getJobsError(message: failure.message)),
      (stream) {
        _jobsSubscription = stream.listen(
          (snapshots) {
            final list = snapshots.docs.map((e) => e.data()).toList();
            final jobs = list.map((e) => JobData.fromJson(e)).toList();
            print("===================>${jobs.length}");
            emit(HomeState.getJobsSuccess(jobs: jobs));
          },
          onError:
              (error) =>
                  emit(HomeState.getJobsError(message: error.toString())),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _jobsSubscription?.cancel();
    return super.close();
  }
}
