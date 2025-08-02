import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:job_hunter/features/auth/data/models/user_model.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/repository/activity_repository.dart';
import '../datasources/activity_remote_data_source.dart';

class ActivityRepositoryImpl
    with BaseRepositoryMixin
    implements ActivityRepository {
  final NetworkInfo _networkInfo;
  final ActivityRemoteDataSource _activityRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  ActivityRepositoryImpl({
    required NetworkInfo networkInfo,
    required ActivityRemoteDataSource activityRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _networkInfo = networkInfo,
       _activityRemoteDataSource = activityRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>>
  getJobs() async {
    return handleApiCall<Stream<QuerySnapshot<Map<String, dynamic>>>>(
      apiCall: () async {
        final user = _authLocalDataSource.user;
        if (user!.role == UserRole.admin) {
          return _activityRemoteDataSource.getJobs(userId: user.id);
        } else {
          return _activityRemoteDataSource.getJobSeekerJobs();
        }
      },
    );
  }
}
