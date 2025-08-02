import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:uuid/uuid.dart';

import '../../../auth/data/models/user_model.dart';
import '../../../post_job/data/models/job_data.dart';
import '../../domain/repositories/job_details_repository.dart';
import '../datasources/job_details_remote_data_source.dart';
import '../models/job_application_model.dart';

class JobDetailsRepositoryImpl
    with BaseRepositoryMixin
    implements JobDetailsRepository {
  final NetworkInfo _networkInfo;
  final JobDetailsRemoteDataSource _jobDetailsRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  JobDetailsRepositoryImpl({
    required NetworkInfo networkInfo,
    required JobDetailsRemoteDataSource jobDetailsRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
  }) : _networkInfo = networkInfo,
       _jobDetailsRemoteDataSource = jobDetailsRemoteDataSource,
       _authLocalDataSource = authLocalDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, void>> deleteJob({required String jobId}) async {
    return handleApiCall<void>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? 'unknown_user';
        return _jobDetailsRemoteDataSource.deleteJob(
          userId: userId,
          jobId: jobId,
        );
      },
    );
  }

  @override
  Future<Either<Failure, void>> applyForJob({
    required JobData jobData,
    required String resume,
    required String coverLetter,
  }) async {
    return handleApiCall<void>(
      apiCall: () async {
        final userId = _authLocalDataSource.user?.id ?? 'UNKNOWN_USER';
        final fullName = _authLocalDataSource.user?.fullName ?? 'Unknown';
        final email = _authLocalDataSource.user?.email ?? 'Unknown';
        return _jobDetailsRemoteDataSource.applyForJob(
          jobData: jobData,
          application: JobApplicationModel(
            id: Uuid().v4(),
            userId: userId,
            fullName: fullName,
            email: email,
            resume: resume,
            coverLetter: coverLetter,
          ),
        );
      },
    );
  }

  @override
  Future<Either<Failure, bool>> isApplied({required String jobId}) async {
    return handleApiCall<bool>(
      apiCall: () async {
        final user = _authLocalDataSource.user;
        if (user!.role == UserRole.admin) {
          return false;
        }
        final userId = user.id;
        final submittedApplications = await _jobDetailsRemoteDataSource
            .getSubmittedApplicationsFromAllJobs(jobId: jobId);
        return submittedApplications.contains(userId);
      },
    );
  }
}
