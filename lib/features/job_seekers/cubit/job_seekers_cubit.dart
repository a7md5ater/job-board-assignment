import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/features/job_seekers/domain/usecases/get_job_seekers_usecase.dart';

import '../../auth/data/models/user_model.dart';

part 'job_seekers_state.dart';
part 'job_seekers_cubit.freezed.dart';

class JobSeekersCubit extends Cubit<JobSeekersState> {
  final GetJobSeekersUseCase _getJobSeekersUseCase;

  JobSeekersCubit({required GetJobSeekersUseCase getJobSeekersUseCase})
    : _getJobSeekersUseCase = getJobSeekersUseCase,
      super(JobSeekersState.initial());

  void getJobSeekers() async {
    emit(const JobSeekersState.getJobSeekersLoading());
    final response = await _getJobSeekersUseCase.call();
    response.fold(
      (failure) =>
          emit(JobSeekersState.getJobSeekersError(message: failure.message)),
      (jobSeekers) =>
          emit(JobSeekersState.getJobSeekersSuccess(jobSeekers: jobSeekers)),
    );
  }
}
