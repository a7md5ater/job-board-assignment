import '../../../../core/firebase/database.dart';
import '../../../post_job/data/models/job_data.dart';

abstract class SubmittedJobsRemoteDataSource {
  Future<List<JobData>> getSubmittedJobs({required String userId});
}

class SubmittedJobsRemoteDataSourceImpl
    implements SubmittedJobsRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  SubmittedJobsRemoteDataSourceImpl({
    required FirebaseDatabase firebaseDatabase,
  }) : _firebaseDatabase = firebaseDatabase;

  @override
  Future<List<JobData>> getSubmittedJobs({required String userId}) {
    return _firebaseDatabase.getSubmittedJobs(userId: userId);
  }
}
