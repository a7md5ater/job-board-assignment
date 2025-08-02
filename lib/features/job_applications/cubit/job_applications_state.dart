part of 'job_applications_cubit.dart';

@freezed
class JobApplicationsState with _$JobApplicationsState {
  const factory JobApplicationsState.initial() = _Initial;
  const factory JobApplicationsState.getJobApplicationsLoading() =
      _GetJobApplicationsLoading;
  const factory JobApplicationsState.getJobApplicationsSuccess({
    required List<JobApplicationModel> applications,
  }) = _GetJobApplicationsSuccess;
  const factory JobApplicationsState.getJobApplicationsError({
    required String message,
  }) = _GetJobApplicationsError;
}
