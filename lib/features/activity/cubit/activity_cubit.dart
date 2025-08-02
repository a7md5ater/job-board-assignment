import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/usecases/get_jobs_use_case.dart';

part 'activity_state.dart';
part 'activity_cubit.freezed.dart';

class ActivityCubit extends Cubit<ActivityState> {
  final GetJobsUseCase _GetJobsUseCase;
  ActivityCubit({required GetJobsUseCase GetJobsUseCase})
    : _GetJobsUseCase = GetJobsUseCase,
      super(ActivityState.changeMonthCalendarIndex(DateTime.now().month - 1));
}
