import '../../../../core/firebase/database.dart';
import '../models/job_data.dart';

abstract class PostJobRemoteDataSource {
  Future<void> postNewJob({required String userId, required JobData jobData});
  Future<void> updateJob({required String userId, required JobData jobData});
}

class PostJobRemoteDataSourceImpl implements PostJobRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  PostJobRemoteDataSourceImpl({required FirebaseDatabase firebaseDatabase})
    : _firebaseDatabase = firebaseDatabase;

  @override
  Future<void> postNewJob({required String userId, required JobData jobData}) {
    return _firebaseDatabase.postNewJob(userId: userId, jobData: jobData);
  }

  @override
  Future<void> updateJob({required String userId, required JobData jobData}) {
    return _firebaseDatabase.updateJob(userId: userId, jobData: jobData);
  }
}
