import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../post_job/data/models/job_data.dart';

abstract class JobDetailsRepository {
  Future<Either<Failure, void>> deleteJob({required String jobId});
  Future<Either<Failure, void>> applyForJob({
    required JobData jobData,
    required String resume,
    required String coverLetter,
  });
  Future<Either<Failure, bool>> isApplied({required String jobId});
}
