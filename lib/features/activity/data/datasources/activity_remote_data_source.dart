import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/firebase/database.dart';

abstract class ActivityRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobs({required String userId});
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobSeekerJobs();
}

class ActivityRemoteDataSourceImpl implements ActivityRemoteDataSource {
  final FirebaseDatabase _firebaseDatabase;

  ActivityRemoteDataSourceImpl({required FirebaseDatabase firebaseDatabase})
    : _firebaseDatabase = firebaseDatabase;
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobs({
    required String userId,
  }) {
    return _firebaseDatabase.getJobs(userId: userId);
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getJobSeekerJobs() {
    return _firebaseDatabase.getJobSeekerJobs();
  }
}
