import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../repositories/job_details_repository.dart';

class DeleteJobUseCase {
  final JobDetailsRepository _jobDetailsRepository;

  DeleteJobUseCase({required JobDetailsRepository jobDetailsRepository})
    : _jobDetailsRepository = jobDetailsRepository;

  Future<Either<Failure, void>> call({required String jobId}) {
    return _jobDetailsRepository.deleteJob(jobId: jobId);
  }
}
