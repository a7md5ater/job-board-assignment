import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../post_job/data/models/job_data.dart';
import '../repositories/submitted_jobs_repository.dart';

class GetSubmittedJobsUseCase {
  final SubmittedJobsRepository _submittedJobsRepository;

  GetSubmittedJobsUseCase({
    required SubmittedJobsRepository submittedJobsRepository,
  }) : _submittedJobsRepository = submittedJobsRepository;

  Future<Either<Failure, List<JobData>>> call() {
    return _submittedJobsRepository.getSubmittedJobs();
  }
}
