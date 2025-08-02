import 'package:dartz/dartz.dart';
import 'package:job_hunter/core/failures/failures.dart';

abstract class SettingsRepository {
  Future<Either<Failure, void>> logout();
}
