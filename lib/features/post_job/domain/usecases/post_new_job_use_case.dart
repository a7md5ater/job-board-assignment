import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/job_data.dart';
import '../repositories/post_job_repository.dart';

class PostNewJobUseCase {
  final PostJobRepository _postJobRepository;

  PostNewJobUseCase({required PostJobRepository postJobRepository})
    : _postJobRepository = postJobRepository;
  Future<Either<Failure, void>> call({required JobData jobData}) async {
    return _postJobRepository.postNewJob(jobData: jobData);
  }
}
