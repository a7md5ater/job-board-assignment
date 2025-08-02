import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/job_data.dart';
import '../repositories/post_job_repository.dart';

class UpdateJobUsecase {
  final PostJobRepository _postJobRepository;

  UpdateJobUsecase({required PostJobRepository postJobRepository})
    : _postJobRepository = postJobRepository;

  Future<Either<Failure, void>> call({required JobData jobData}) {
    return _postJobRepository.updateJob(jobData: jobData);
  }
}
