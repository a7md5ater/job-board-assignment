part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.changeNavBarIndex(int index) = ChangeNavBarIndex;
  const factory HomeState.getJobsSuccess({required List<JobData> jobs}) =
      _getJobsSuccess;
  const factory HomeState.getJobsError({required String message}) =
      _getJobsError;
  const factory HomeState.getJobsLoading() = _getJobsLoading;
}
