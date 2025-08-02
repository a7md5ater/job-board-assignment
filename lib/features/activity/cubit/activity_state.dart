part of 'activity_cubit.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.changeMonthCalendarIndex(int index) =
      _ChangeMonthCalendarIndex;
  // const factory ActivityState.getJobsSuccess({
  //   required List<JobData> jobs,
  // }) = _getJobsSuccess;
  // const factory ActivityState.getJobsError({required String message}) =
  //     _getJobsError;
  // const factory ActivityState.getJobsLoading() = _getJobsLoading;
}
