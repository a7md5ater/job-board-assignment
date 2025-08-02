import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';

import '../../../job_details/data/models/job_application_model.dart';
import '../../domain/repositories/job_applications_repository.dart';
import '../datasources/job_applications_remote_data_source.dart';

class JobApplicationsRepositoryImpl
    with BaseRepositoryMixin
    implements JobApplicationsRepository {
  final NetworkInfo _networkInfo;
  final JobApplicationsRemoteDataSource _jobApplicationsRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  JobApplicationsRepositoryImpl({
    required NetworkInfo networkInfo,
    required JobApplicationsRemoteDataSource jobApplicationsRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _networkInfo = networkInfo,
       _jobApplicationsRemoteDataSource = jobApplicationsRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, List<JobApplicationModel>>> getSubmittedApplications({
    required String jobId,
  }) async {
    return handleApiCall<List<JobApplicationModel>>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? 'unknown_user';
        return _jobApplicationsRemoteDataSource
            .getSubmittedApplicationsFromAdminJobs(
              userId: userId,
              jobId: jobId,
            );
      },
    );
  }
}
