import 'package:dartz/dartz.dart';
import 'package:job_hunter/features/auth/data/models/user_model.dart';

import '../../../../core/base_repository/base_repository.dart';
import '../../../../core/failures/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_body.dart';
import '../models/register_body.dart';

class AuthRepositoryImpl with BaseRepositoryMixin implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
    required NetworkInfo networkInfo,
  }) : _authRemoteDataSource = authRemoteDataSource,
       _authLocalDataSource = authLocalDataSource,
       _networkInfo = networkInfo;

  @override
  NetworkInfo get networkInfo => _networkInfo;

  @override
  Future<Either<Failure, UserModel>> login({required LoginBody loginBody}) {
    return handleApiCall<UserModel>(
      apiCall: () async {
        final loginResponse = await _authRemoteDataSource.login(
          loginBody: loginBody,
        );

        final getUser = await _getCurrentUser(
          id: loginResponse.user?.uid ?? '',
        );
        final response = getUser.fold(
          (failure) => throw failure,
          (user) => user,
        );

        await _authLocalDataSource.saveUser(userModel: response);

        return response;
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required RegisterBody registerBody,
  }) async {
    return handleApiCall<UserModel>(
      apiCall: () async {
        final registerResponse = await _authRemoteDataSource.register(
          registerBody: registerBody,
        );

        final user = UserModel(
          id: registerResponse.user?.uid ?? '',
          fullName: '${registerBody.firstName} ${registerBody.lastName}',
          email: registerBody.email,
          role: registerBody.role,
        );

        final addUser = await _addUserToFirestore(user: user);
        final response = addUser.fold((failure) => throw failure, (success) {
          return success;
        });
        return response;
      },
    );
  }

  Future<Either<Failure, UserModel>> _addUserToFirestore({
    required UserModel user,
  }) => handleApiCall<UserModel>(
    apiCall: () async {
      await _authRemoteDataSource.addUserToFirestore(user: user);
      return user;
    },
  );

  Future<Either<Failure, UserModel>> _getCurrentUser({
    required String id,
  }) async {
    return handleApiCall<UserModel>(
      apiCall: () {
        return _authRemoteDataSource.getCurrentUser(id: id);
      },
    );
  }
}
