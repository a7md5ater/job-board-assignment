import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_hunter/core/utils/app_enums.dart';
import 'package:job_hunter/features/post_job/domain/usecases/update_job_usecase.dart';

import '../data/models/job_data.dart';
import '../domain/usecases/post_new_job_use_case.dart';

part 'post_job_state.dart';
part 'post_job_cubit.freezed.dart';

class PostJobCubit extends Cubit<PostJobState> {
  final PostNewJobUseCase _postNewJobUseCase;
  final UpdateJobUsecase _updateJobUsecase;

  PostJobCubit({
    required PostNewJobUseCase postNewJobUseCase,
    required UpdateJobUsecase updateJobUsecase,
  }) : _postNewJobUseCase = postNewJobUseCase,
       _updateJobUsecase = updateJobUsecase,
       super(const PostJobState.initial());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  JobStatus? jobStatus;

  void postNewJob({JobData? jobData}) async {
    emit(const PostJobState.postJobLoading());
    print("===========>${jobStatus}");
    final job =
        jobData?.copyWith(
          id: jobData.id ?? '',
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          location: locationController.text.trim(),
          salary: salaryController.text.trim(),
          status: jobStatus,
        ) ??
        JobData(
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          location: locationController.text.trim(),
          salary: salaryController.text.trim(),
        );
    final response =
        jobData != null
            ? await _updateJobUsecase.call(jobData: job)
            : await _postNewJobUseCase.call(jobData: job);

    response.fold(
      (failure) => emit(PostJobState.postJobError(message: failure.message)),
      (_) => emit(const PostJobState.postJob(name: 'sa')),
    );
  }

  void initializeFields({required JobData jobData}) {
    titleController.text = jobData.title ?? 'No title provided';
    descriptionController.text =
        jobData.description ?? 'No description provided';
    locationController.text = jobData.location ?? 'No location provided';
    salaryController.text = jobData.salary ?? 'No salary provided';
    jobStatus = jobData.status;
    emit(PostJobState.initializeJobFields(id: jobData.id ?? ''));
  }

  void changeJobStatus({required JobStatus status}) {
    jobStatus = status;
    emit(PostJobState.changeJobStatus(status: status));
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    salaryController.dispose();
    return super.close();
  }
}
