import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../post_job/data/models/job_data.dart';
import '../repositories/job_details_repository.dart';

class ApplyForJobUseCase {
  final JobDetailsRepository _jobDetailsRepository;

  ApplyForJobUseCase({required JobDetailsRepository jobDetailsRepository})
    : _jobDetailsRepository = jobDetailsRepository;

  Future<Either<Failure, void>> call({
    required JobData jobData,
    required String resume,
    required String coverLetter,
  }) {
    return _jobDetailsRepository.applyForJob(
      jobData: jobData,
      resume: resume,
      coverLetter: coverLetter,
    );
  }
}
