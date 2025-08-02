import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../../../auth/data/models/user_model.dart';

abstract class JobSeekersRepository {
  Future<Either<Failure, List<UserModel>>> getJobSeekers();
}
