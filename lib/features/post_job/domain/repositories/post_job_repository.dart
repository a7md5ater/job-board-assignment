import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/job_data.dart';

abstract class PostJobRepository {
  Future<Either<Failure, void>> postNewJob({required JobData jobData});
  Future<Either<Failure, void>> updateJob({required JobData jobData});
}
