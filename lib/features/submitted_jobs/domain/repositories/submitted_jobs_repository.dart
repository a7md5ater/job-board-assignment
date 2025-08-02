import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../post_job/data/models/job_data.dart';

abstract class SubmittedJobsRepository {
  Future<Either<Failure, List<JobData>>> getSubmittedJobs();
}
