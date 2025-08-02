import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../repository/activity_repository.dart';

class GetJobsUseCase {
  final ActivityRepository _activityRepository;

  GetJobsUseCase({required ActivityRepository activityRepository})
    : _activityRepository = activityRepository;

  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>> call() {
    return _activityRepository.getJobs();
  }
}
