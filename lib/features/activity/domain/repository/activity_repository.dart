import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

abstract class ActivityRepository {
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  getJobs();
  // Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  // getJobSeekerJobs();
}
