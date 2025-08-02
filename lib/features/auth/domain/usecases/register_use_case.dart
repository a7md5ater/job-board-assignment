import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/register_body.dart';
import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<Either<Failure, UserModel>> call({
    required RegisterBody registerBody,
  }) {
    return _authRepository.register(registerBody: registerBody);
  }
}
