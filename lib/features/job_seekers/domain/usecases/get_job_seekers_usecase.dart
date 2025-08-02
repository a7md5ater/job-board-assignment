import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../repositories/job_seekers_repository.dart';

class GetJobSeekersUseCase {
  final JobSeekersRepository _jobSeekersRepository;

  GetJobSeekersUseCase({required JobSeekersRepository jobSeekersRepository})
    : _jobSeekersRepository = jobSeekersRepository;

  Future<Either<Failure, List<UserModel>>> call() {
    return _jobSeekersRepository.getJobSeekers();
  }
}
