import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:job_hunter/features/post_job/data/models/job_data.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/app_enums.dart';
import '../../domain/repositories/post_job_repository.dart';
import '../datasources/post_job_remote_data_source.dart';

class PostJobRepositoryImpl
    with BaseRepositoryMixin
    implements PostJobRepository {
  final NetworkInfo _networkInfo;
  final PostJobRemoteDataSource _postJobRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  PostJobRepositoryImpl({
    required NetworkInfo networkInfo,
    required PostJobRemoteDataSource postJobRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _networkInfo = networkInfo,
       _postJobRemoteDataSource = postJobRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, void>> postNewJob({required JobData jobData}) async {
    return handleApiCall<void>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? 'unknown_user';
        final createdBy = _authLocalDataSource.user?.fullName ?? 'unknown_user';
        await _postJobRemoteDataSource.postNewJob(
          userId: userId,
          jobData: jobData.copyWith(
            id: Uuid().v4(),
            createdAt: DateTime.now().toUtc().toString(),
            createdBy: createdBy,
            createdById: userId,
            status: JobStatus.open,
          ),
        );
      },
    );
  }

  @override
  Future<Either<Failure, void>> updateJob({required JobData jobData}) async {
    return handleApiCall<void>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? 'unknown_user';
        return _postJobRemoteDataSource.updateJob(
          userId: userId,
          jobData: jobData,
        );
      },
    );
  }
}
