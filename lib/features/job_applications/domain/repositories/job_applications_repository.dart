import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../job_details/data/models/job_application_model.dart';

abstract class JobApplicationsRepository {
  Future<Either<Failure, List<JobApplicationModel>>> getSubmittedApplications({
    required String jobId,
  });
}
