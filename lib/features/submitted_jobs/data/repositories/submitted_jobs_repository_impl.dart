import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';

import '../../../post_job/data/models/job_data.dart';
import '../../domain/repositories/submitted_jobs_repository.dart';
import '../datasources/submitted_jobs_remote_data_source.dart';

class SubmittedJobsRepositoryImpl
    with BaseRepositoryMixin
    implements SubmittedJobsRepository {
  final NetworkInfo _networkInfo;
  final SubmittedJobsRemoteDataSource _SubmittedJobsRemoteDataSource;

  final AuthLocalDataSource _authLocalDataSource;

  SubmittedJobsRepositoryImpl({
    required NetworkInfo networkInfo,
    required SubmittedJobsRemoteDataSource SubmittedJobsRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _networkInfo = networkInfo,
       _SubmittedJobsRemoteDataSource = SubmittedJobsRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, List<JobData>>> getSubmittedJobs() async {
    return handleApiCall<List<JobData>>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? '';
        return _SubmittedJobsRemoteDataSource.getSubmittedJobs(userId: userId);
      },
    );
  }
}
