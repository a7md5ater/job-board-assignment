import '../../../../core/firebase/database.dart';
import '../../../post_job/data/models/job_data.dart';
import '../models/job_application_model.dart';

abstract class JobDetailsRemoteDataSource {
  Future<void> deleteJob({required String userId, required String jobId});
  Future<void> applyForJob({
    required JobData jobData,
    required JobApplicationModel application,
  });

  Future<List<String>> getSubmittedApplicationsFromAllJobs({
    required String jobId,
  });
}

class JobDetailsRemoteDataSourceImpl implements JobDetailsRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  JobDetailsRemoteDataSourceImpl({required FirebaseDatabase firebaseDatabase})
    : _firebaseDatabase = firebaseDatabase;

  @override
  Future<void> deleteJob({required String userId, required String jobId}) {
    return _firebaseDatabase.deleteJob(userId: userId, jobId: jobId);
  }

  @override
  Future<void> applyForJob({
    required JobData jobData,
    required JobApplicationModel application,
  }) {
    return _firebaseDatabase.applyForJob(
      jobData: jobData,
      application: application,
    );
  }

  @override
  Future<List<String>> getSubmittedApplicationsFromAllJobs({
    required String jobId,
  }) {
    return _firebaseDatabase.getSubmittedApplicationsFromAllJobs(jobId: jobId);
  }
}
