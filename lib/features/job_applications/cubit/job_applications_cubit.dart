import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/features/job_applications/domain/usecases/get_submitted_applications_usecase.dart';
import 'package:job_hunter/features/job_details/data/models/job_application_model.dart';

part 'job_applications_state.dart';
part 'job_applications_cubit.freezed.dart';

class JobApplicationsCubit extends Cubit<JobApplicationsState> {
  final GetSubmittedApplicationsUseCase _getSubmittedApplicationsUseCase;

  JobApplicationsCubit({
    required GetSubmittedApplicationsUseCase getSubmittedApplicationsUseCase,
  }) : _getSubmittedApplicationsUseCase = getSubmittedApplicationsUseCase,
       super(JobApplicationsState.initial());

  void getJobApplications({required String jobId}) async {
    emit(JobApplicationsState.getJobApplicationsLoading());
    final result = await _getSubmittedApplicationsUseCase.call(jobId: jobId);
    result.fold(
      (failure) => emit(
        JobApplicationsState.getJobApplicationsError(message: failure.message),
      ),
      (applications) => emit(
        JobApplicationsState.getJobApplicationsSuccess(
          applications: applications,
        ),
      ),
    );
  }
}
