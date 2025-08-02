import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/base_repository/base_repository.dart';
import 'package:job_hunter/core/failures/failures.dart';
import 'package:job_hunter/core/network/network_info.dart';
import 'package:job_hunter/features/settings/domain/repositories/settings_repository.dart';

import '../../../../app/injector.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../datasources/settings_remote_data_source.dart';

class SettingsRepositoryImpl
    with BaseRepositoryMixin
    implements SettingsRepository {
  final NetworkInfo _networkInfo;
  final SettingsRemoteDataSource _settingsRemoteDataSource;

  SettingsRepositoryImpl({
    required NetworkInfo networkInfo,
    required SettingsRemoteDataSource settingsRemoteDataSource,
  }) : _networkInfo = networkInfo,
       _settingsRemoteDataSource = settingsRemoteDataSource;
  @override
  NetworkInfo get networkInfo => _networkInfo;
  @override
  Future<Either<Failure, void>> logout() async {
    return handleApiCall<void>(
      apiCall: () async {
        await _settingsRemoteDataSource.logout();
        await di<AuthLocalDataSource>().deleteUser();
        return;
      },
    );
  }
}
