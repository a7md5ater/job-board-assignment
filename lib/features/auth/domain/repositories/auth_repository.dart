import 'package:dartz/dartz.dart';
import 'package:job_hunter/features/auth/data/models/user_model.dart';

import '../../../../core/failures/failures.dart';
import '../../data/models/login_body.dart';
import '../../data/models/register_body.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> register({
    required RegisterBody registerBody,
  });

  Future<Either<Failure, UserModel>> login({required LoginBody loginBody});
}
