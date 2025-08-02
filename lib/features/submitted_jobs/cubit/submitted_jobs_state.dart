part of 'submitted_jobs_cubit.dart';

@freezed
class SubmittedJobsState with _$SubmittedJobsState {
  const factory SubmittedJobsState.initial() = _Initial;
  const factory SubmittedJobsState.getSubmittedJobsLoading() =
      _GetSubmittedJobsLoading;
  const factory SubmittedJobsState.getSubmittedJobsSuccess({
    required List<JobData> jobs,
  }) = _GetSubmittedJobsSuccess;
  const factory SubmittedJobsState.getSubmittedJobsError({
    required String message,
  }) = _GetSubmittedJobsError;
}
