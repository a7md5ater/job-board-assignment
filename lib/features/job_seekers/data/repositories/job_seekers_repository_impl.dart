import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/auth/data/models/user_model.dart';

import '../../domain/repositories/job_seekers_repository.dart';
import '../datasources/job_seekers_remote_data_source.dart';

class JobSeekersRepositoryImpl
    with BaseRepositoryMixin
    implements JobSeekersRepository {
  final NetworkInfo _networkInfo;
  final JobSeekersRemoteDataSource _jobSeekersRemoteDataSource;

  JobSeekersRepositoryImpl({
    required NetworkInfo networkInfo,
    required JobSeekersRemoteDataSource jobSeekersRemoteDataSource,
  }) : _networkInfo = networkInfo,
       _jobSeekersRemoteDataSource = jobSeekersRemoteDataSource;

  @override
  NetworkInfo get networkInfo => _networkInfo;
  @override
  Future<Either<Failure, List<UserModel>>> getJobSeekers() async {
    return handleApiCall<List<UserModel>>(
      apiCall: () async {
        return _jobSeekersRemoteDataSource.getJobSeekers();
      },
    );
  }
}
