part of 'post_job_cubit.dart';

@freezed
class PostJobState with _$PostJobState {
  const factory PostJobState.initial() = _Initial;
  const factory PostJobState.postJob({required String name}) = _PostJob;
  const factory PostJobState.postJobLoading() = _PostJobLoading;
  const factory PostJobState.postJobError({required String message}) =
      _PostJobError;
  const factory PostJobState.initializeJobFields({required String id}) =
      _InitializeJobFields;
  const factory PostJobState.changeJobStatus({required JobStatus status}) =
      _ChangeJobStatus;
}
