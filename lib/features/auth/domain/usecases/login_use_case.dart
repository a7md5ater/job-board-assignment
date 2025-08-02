import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/login_body.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Either<Failure, UserModel>> call({
    required LoginBody loginBody,
  }) async {
    return _authRepository.login(loginBody: loginBody);
  }
}
