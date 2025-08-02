import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/features/job_details/domain/usecases/apply_for_job_usecase.dart';
import 'package:job_hunter/features/job_details/domain/usecases/delete_job_usecase.dart';

import '../../post_job/data/models/job_data.dart';
import '../domain/usecases/is_applied_usecase.dart';

part 'job_details_state.dart';
part 'job_details_cubit.freezed.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  final DeleteJobUseCase _deleteJobUseCase;
  final ApplyForJobUseCase _applyForJobUseCase;
  final IsAppliedUseCase _isAppliedUseCase;
  JobDetailsCubit({
    required DeleteJobUseCase deleteJobUseCase,
    required ApplyForJobUseCase applyForJobUseCase,
    required IsAppliedUseCase isAppliedUseCase,
  }) : _deleteJobUseCase = deleteJobUseCase,
       _applyForJobUseCase = applyForJobUseCase,
       _isAppliedUseCase = isAppliedUseCase,
       super(JobDetailsState.initial());

  void deleteJob({required String jobId}) async {
    emit(JobDetailsState.deleteJobLoading());
    final result = await _deleteJobUseCase(jobId: jobId);
    result.fold(
      (failure) =>
          emit(JobDetailsState.deleteJobError(message: failure.message)),
      (_) => emit(JobDetailsState.deleteJobSuccess()),
    );
  }

  final TextEditingController resumeController = TextEditingController();
  final TextEditingController coverLetterController = TextEditingController();
  void applyForJob({required JobData jobData}) async {
    emit(JobDetailsState.applyForJobLoading());
    final result = await _applyForJobUseCase(
      jobData: jobData,
      resume: resumeController.text,
      coverLetter: coverLetterController.text,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(JobDetailsState.applyForJobError(message: failure.message));
        }
      },
      (_) {
        if (!isClosed) {
          emit(JobDetailsState.applyForJobSuccess());
        }
      },
    );
  }

  void checkIfApplied({required String jobId}) async {
    print("ASASAS");
    emit(JobDetailsState.isAppliedLoading());

    final result = await _isAppliedUseCase(jobId: jobId);
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(JobDetailsState.isAppliedError(message: failure.message));
        }
      },
      (isApplied) {
        if (!isClosed) {
          emit(JobDetailsState.isAppliedSuccess(isApplied: isApplied));
        }
      },
    );
  }

  @override
  Future<void> close() {
    resumeController.dispose();
    coverLetterController.dispose();
    return super.close();
  }
}
