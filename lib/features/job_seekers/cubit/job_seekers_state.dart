part of 'job_seekers_cubit.dart';

@freezed
class JobSeekersState with _$JobSeekersState {
  const factory JobSeekersState.initial() = _Initial;
  const factory JobSeekersState.getJobSeekersLoading() = _GetJobSeekersLoading;
  const factory JobSeekersState.getJobSeekersSuccess({
    required List<UserModel> jobSeekers,
  }) = _GetJobSeekersSuccess;
  const factory JobSeekersState.getJobSeekersError({required String message}) =
      _GetJobSeekersError;
}
