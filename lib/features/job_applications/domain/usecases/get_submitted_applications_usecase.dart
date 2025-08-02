import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../job_details/data/models/job_application_model.dart';
import '../repositories/job_applications_repository.dart';

class GetSubmittedApplicationsUseCase {
  final JobApplicationsRepository _jobApplicationsRepository;

  GetSubmittedApplicationsUseCase({
    required JobApplicationsRepository jobApplicationsRepository,
  }) : _jobApplicationsRepository = jobApplicationsRepository;

  Future<Either<Failure, List<JobApplicationModel>>> call({
    required String jobId,
  }) => _jobApplicationsRepository.getSubmittedApplications(jobId: jobId);
}
