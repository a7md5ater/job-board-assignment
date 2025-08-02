import 'package:job_hunter/features/job_details/data/models/job_application_model.dart';

import '../../../../core/firebase/database.dart';

abstract class JobApplicationsRemoteDataSource {
  Future<List<JobApplicationModel>> getSubmittedApplicationsFromAdminJobs({
    required String userId,
    required String jobId,
  });
}

class JobApplicationsRemoteDataSourceImpl
    implements JobApplicationsRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  JobApplicationsRemoteDataSourceImpl({
    required FirebaseDatabase firebaseDatabase,
  }) : _firebaseDatabase = firebaseDatabase;

  @override
  Future<List<JobApplicationModel>> getSubmittedApplicationsFromAdminJobs({
    required String userId,
    required String jobId,
  }) {
    return _firebaseDatabase.getSubmittedApplicationsFromAdminJobs(
      userId: userId,
      jobId: jobId,
    );
  }
}
