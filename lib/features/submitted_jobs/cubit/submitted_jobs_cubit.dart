import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../post_job/data/models/job_data.dart';
import '../domain/usecases/get_submitted_jobs_usecase.dart';

part 'submitted_jobs_state.dart';
part 'submitted_jobs_cubit.freezed.dart';

class SubmittedJobsCubit extends Cubit<SubmittedJobsState> {
  final GetSubmittedJobsUseCase _getSubmittedJobsUseCase;
  SubmittedJobsCubit({required GetSubmittedJobsUseCase getSubmittedJobsUseCase})
    : _getSubmittedJobsUseCase = getSubmittedJobsUseCase,
      super(SubmittedJobsState.initial());

  void getSubmittedJobs() async {
    emit(SubmittedJobsState.getSubmittedJobsLoading());
    final result = await _getSubmittedJobsUseCase();
    result.fold(
      (failure) => emit(
        SubmittedJobsState.getSubmittedJobsError(message: failure.message),
      ),
      (jobs) => emit(SubmittedJobsState.getSubmittedJobsSuccess(jobs: jobs)),
    );
  }
}
