part of 'job_details_cubit.dart';

@freezed
class JobDetailsState with _$JobDetailsState {
  const factory JobDetailsState.initial() = _Initial;
  const factory JobDetailsState.deleteJobLoading() = _DeleteJobLoading;
  const factory JobDetailsState.deleteJobSuccess() = _DeleteJobSuccess;
  const factory JobDetailsState.deleteJobError({required String message}) =
      _DeleteJobError;
  const factory JobDetailsState.applyForJobLoading() = _ApplyForJobLoading;
  const factory JobDetailsState.applyForJobSuccess() = _ApplyForJobSuccess;
  const factory JobDetailsState.applyForJobError({required String message}) =
      _ApplyForJobError;
  const factory JobDetailsState.isAppliedLoading() = _IsAppliedLoading;
  const factory JobDetailsState.isAppliedSuccess({required bool isApplied}) =
      _IsAppliedSuccess;
  const factory JobDetailsState.isAppliedError({required String message}) =
      _IsAppliedError;
}
