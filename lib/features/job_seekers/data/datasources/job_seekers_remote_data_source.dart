import '../../../../core/firebase/database.dart';
import '../../../auth/data/models/user_model.dart';

abstract class JobSeekersRemoteDataSource {
  Future<List<UserModel>> getJobSeekers();
}

class JobSeekersRemoteDataSourceImpl implements JobSeekersRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  JobSeekersRemoteDataSourceImpl({required FirebaseDatabase firebaseDatabase})
    : _firebaseDatabase = firebaseDatabase;

  @override
  Future<List<UserModel>> getJobSeekers() {
    return _firebaseDatabase.getJobSeekers();
  }
}
