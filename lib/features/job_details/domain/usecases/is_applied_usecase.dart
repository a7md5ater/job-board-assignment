import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../repositories/job_details_repository.dart';

class IsAppliedUseCase {
  final JobDetailsRepository _jobDetailsRepository;

  IsAppliedUseCase({required JobDetailsRepository jobDetailsRepository})
    : _jobDetailsRepository = jobDetailsRepository;

  Future<Either<Failure, bool>> call({required String jobId}) {
    return _jobDetailsRepository.isApplied(jobId: jobId);
  }
}
